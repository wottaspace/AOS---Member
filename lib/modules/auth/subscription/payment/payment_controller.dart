import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/core/models/payment_card.dart';
import 'package:arcopen_employee/core/models/plan.dart';
import 'package:arcopen_employee/http/requests/pay_subscription_request.dart';
import 'package:arcopen_employee/modules/settings/bank_details/bank_details_controller.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/subscriptions_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:okito/okito.dart';

class PaymentController extends OkitoController with ToastMixin {
  List<PaymentCard> paymentMethods = [];

  PaymentCard? card;
  String? cvv;
  Plan? plan;
  String? billingCycle = "yearly";

  final List<String> billingCycles = ["monthly", "yearly"];

  final SubscriptionsRepository subscriptionsRepository = SubscriptionsRepository();

  set setSelectedPaymentMethod(PaymentCard card) {
    setState(() {
      this.card = card;
    });
  }

  set setSelectedBillingCycle(String cycle) {
    setState(() {
      this.billingCycle = cycle;
    });
  }

  Future<void> initialize() async {
    this.plan = Okito.arguments["plan"];
    if (this.plan == null) {
      this.showErrorToast("You need to choose a subscription plan first.");
      await Future.delayed(Duration(seconds: 3));
      Okito.pop();
    }
    this.getPaymentMethods();
  }

  getPaymentMethods() {
    paymentMethods = BankDetailsController().getPaymentMethods();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {});
    });
  }

  void paySubscription() {
    if (this.card == null) {
      this.showErrorToast("You need to choose a payment method first.");
      return;
    }
    if (this.cvv == null || (this.cvv?.isEmpty ?? true)) {
      this.showErrorToast("Please enter the cvv");
      return;
    }
    if (!this.billingCycles.contains(this.billingCycle)) {
      this.showErrorToast("Unknown billing cycle");
      return;
    }
    KLoader().show();
    final PaySubscriptionRequest request = PaySubscriptionRequest(card: card!, plan: plan!, cycle: this.billingCycle!, cvv: this.cvv!);
    subscriptionsRepository.cardSubscription(request: request).then((value) {
      KLoader.hide();
      this.showSuccessToast(value.status);
      Okito.pushNamedAndRemoveUntil(
        KRoutes.choosePlanRoute,
        predicate: (route) => route.settings.name == KRoutes.choosePlanRoute,
      );
    }).catchError((e) {
      KLoader.hide();
      this.showErrorToast(e.message);
    });
  }
}
