import 'package:arcopen_employee/core/models/transaction.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/finances_repository.dart';
import 'package:okito/okito.dart';

class FinanceListController extends OkitoController with ToastMixin {
  FinanceListController._internal();
  static final FinanceListController _singleton = FinanceListController._internal();

  factory FinanceListController() {
    return _singleton;
  }

  List<Transaction> paidTransactions = [];
  List<Transaction> unPaidTransactions = [];

  String totalPaid = "";
  String totalJobs = "";
  LoadingState loadingState = LoadingState.loading;

  final FinancesRepository _repository = FinancesRepository();

  loadFinances() {
    setState(() {
      loadingState = LoadingState.loading;
    });
    _repository.getFinances().then((value) {
      setState(() {
        paidTransactions = value.paidTransactions;
        unPaidTransactions = value.unpaidTransactions;
        loadingState = LoadingState.success;
      });
    }).catchError((e) {
      setState(() {
        loadingState = LoadingState.failed;
      });
      this.showErrorToast("Sorry, we were not able to load the data. Please try again later.");
      return;
    });
  }
}
