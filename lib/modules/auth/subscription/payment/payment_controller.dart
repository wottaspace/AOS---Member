import 'package:arcopen_employee/core/models/payment_card.dart';
import 'package:arcopen_employee/modules/settings/bank_details/bank_details_controller.dart';
import 'package:okito/okito.dart';

class PaymentController extends OkitoController {
  List<PaymentCard> paymentMethods = [];

  getPaymentMethods() {
    paymentMethods = BankDetailsController().getPaymentMethods();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {});
    });
  }
}
