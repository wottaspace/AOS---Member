import 'package:arcopen_employee/core/models/plan.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/subscriptions_repository.dart';
import 'package:okito/okito.dart';

class SubscriptionController extends OkitoController with ToastMixin {
  SubscriptionController._internal();
  static final SubscriptionController _singleton = SubscriptionController._internal();

  factory SubscriptionController() {
    return _singleton;
  }

  final SubscriptionsRepository repository = SubscriptionsRepository();

  List<Plan> subscriptionPlans = [];
  LoadingState loadingState = LoadingState.loading;

  void getSubscriptionPlans() {
    setState(() {
      loadingState = LoadingState.loading;
    });
    repository.getSubscriptionPlans().then((value) {
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
}
