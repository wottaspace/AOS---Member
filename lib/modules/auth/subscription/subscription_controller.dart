import 'package:arcopen_employee/core/models/plan.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/logging_mixin.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/subscriptions_repository.dart';
import 'package:okito/okito.dart';

class SubscriptionController extends OkitoController with ToastMixin, LoggingMixin {
  SubscriptionController._internal();
  static final SubscriptionController _singleton = SubscriptionController._internal();

  factory SubscriptionController() {
    return _singleton;
  }

  final SubscriptionsRepository repository = SubscriptionsRepository();

  List<Plan> subscriptionPlans = [];
  Plan? activePlan;
  LoadingState loadingState = LoadingState.loading;

  Future<void> loadData() async {
    await getSubscriptionPlans();
    getActivePlan();
  }

  Future<void> getSubscriptionPlans() async {
    setState(() {
      loadingState = LoadingState.loading;
    });
    await repository.getSubscriptionPlans().then((value) {
      setState(() {
        loadingState = LoadingState.success;
        subscriptionPlans = [...value.freePlans, ...value.memberPlans];
      });
    }).catchError((e) {
      setState(() {
        loadingState = LoadingState.failed;
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
