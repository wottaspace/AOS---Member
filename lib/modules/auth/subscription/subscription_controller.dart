import 'package:arcopen_employee/core/base_controller.dart';
import 'package:arcopen_employee/core/models/plan.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/logging_mixin.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/subscriptions_repository.dart';

class SubscriptionController extends BaseController with ToastMixin, LoggingMixin {
  SubscriptionController._internal();
  static final SubscriptionController _singleton = SubscriptionController._internal();

  factory SubscriptionController() {
    return _singleton;
  }

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
}
