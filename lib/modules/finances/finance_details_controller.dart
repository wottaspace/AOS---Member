import 'package:arcopen_employee/core/base_controller.dart';
import 'package:arcopen_employee/utils/repositories/finances_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class FinanceDetailsController extends BaseController {
  static final FinanceDetailsController shared = FinanceDetailsController();
  final FinancesRepository repository = FinancesRepository();

  void downloadInvoice(int transactionId) {
    KLoader().show();
    repository.downloadInvoice(transactionId).then((value) async {
      KLoader.hide();
      if (await canLaunch(value.fileLink)) {
        launch(value.fileLink);
      } else {
        this.showErrorToast("Failed to download invoice.");
      }
    }).catchError((e) {
      KLoader.hide();
      this.showErrorToast("Failed to download invoice.");
    });
  }
}
