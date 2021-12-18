import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/utils/mixins/logging_mixin.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:okito/okito.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Plan Ids
/// basic_member_1250_1m
/// dove_member_15_1m
/// basic_member_150_1y
/// dove_member_160_1y
class SubscriptionService with LoggingMixin, ToastMixin {
  static final String revenueCatApiKey = dotenv.env["REVENUE_CAT_API_KEY"]!;
  String? activeSubscription;

  Future<void> init() async {
    await Purchases.setDebugLogsEnabled(kDebugMode);
    await Purchases.setup(revenueCatApiKey, appUserId: Okito.use<AuthService>().user.id);
  }

  Future<Offering?> getCurrentSubscription() async {
    PurchaserInfo purchaserInfo = await Purchases.getPurchaserInfo();
    if (purchaserInfo.activeSubscriptions.isNotEmpty) {
      final String sub = purchaserInfo.activeSubscriptions.first;
      if (sub.contains("dove")) {
        activeSubscription = "dove_member";
      } else {
        activeSubscription = "member";
      }
    }
  }

  Future<void> purchaseItem(String offeringName, PackageType duration) async {
    final offerings = await Purchases.getOfferings();
    Offering? selectedOffering = offerings.getOffering(offeringName);

    if (selectedOffering == null) {
      showErrorToast("An unknown error occurred while processing the request. If the problem persists, please contact support.");
      return;
    }
    try {
      final package = selectedOffering.availablePackages.firstWhere((element) => element.packageType == duration);
      if (await _purchasePackage(package)) {
        activeSubscription = offeringName;
        Okito.popUntil(KRoutes.exploreRoute);
        showSuccessToast("🎉 Congrats ! You've successfully subscribed to the ${offeringName.split("_").join(" ")} plan.");
      } else {
        showErrorToast("The purchase of the subscription failed. Please try again later.\nIf it persists, please contact support.");
      }
    } catch (e) {
      logger.e(e);
      showErrorToast("An unknown error prevents us from continuing. If it persists, please contact support.");
    }
  }

  Future<bool> _purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
