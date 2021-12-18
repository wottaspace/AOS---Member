import 'package:arcopen_employee/core/base_controller.dart';
import 'package:arcopen_employee/core/models/plan.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/logging_mixin.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/subscriptions_repository.dart';
import 'package:arcopen_employee/utils/services/subscription_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:purchases_flutter/object_wrappers.dart';

class SubscriptionController extends BaseController with ToastMixin, LoggingMixin {
  static final shared = SubscriptionController();

  final SubscriptionsRepository repository = SubscriptionsRepository();

  List<Plan> subscriptionPlans = [];
  Plan? activePlan;

  Future<void> loadData() async {
    await getSubscriptionPlans();
    getActivePlan();
  }

  Future<void> getSubscriptionPlans() async {
    setState(() {
      state = LoadingState.loading;
    });
    await repository.getSubscriptionPlans().then((value) {
      setState(() {
        state = LoadingState.success;
        subscriptionPlans = [...value.freePlans, ...value.memberPlans];
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
      this.showErrorToast("Sorry, we are not able to load the data. Please try again later.");
    });
  }

  void getActivePlan() {
    repository.getActivePlan().then((value) {
      if (value.subscription.isNotEmpty) {
        this.activePlan = subscriptionPlans.firstWhere(
          ((element) => element.planId == value.subscription.first.planId),
          orElse: () => this.subscriptionPlans.first,
        );
      }
    }).catchError((e) {
      logger.e(e.message, e);
    });
  }

  Future<void> upgradePlan(Plan plan) async {
    /// If choosen plan is free and user has an active subscription
    /// they need to cancel their current subscription
    final duration = await _getDuration();
    if (duration == null) {
      showErrorToast("You need to choose a duration first.");
      return;
    }
    late String offeringName;
    if (plan.name.toLowerCase() == "dove") offeringName = "dove_member";
    if (plan.name.toLowerCase() == "basic") offeringName = "basic_member";

    Okito.use<SubscriptionService>().purchaseItem(offeringName, duration);
  }

  Future<PackageType?> _getDuration() {
    return showModalBottomSheet(
      context: Okito.context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Choose a billing cycle",
              style: Okito.theme.textTheme.headline2!.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(PhosphorIcons.circle_bold),
              title: Text("Month"),
              onTap: () {
                Okito.pop(result: PackageType.monthly);
              },
            ),
            ListTile(
              leading: Icon(PhosphorIcons.circle_bold),
              title: Text("Year"),
              onTap: () {
                Okito.pop(result: PackageType.annual);
              },
            ),
          ],
        );
      },
    );
  }
}
