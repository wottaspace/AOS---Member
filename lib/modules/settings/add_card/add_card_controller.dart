import 'package:arcopen_employee/modules/settings/bank_details/bank_details_controller.dart';
import 'package:credit_card_input_form/model/card_info.dart';
import 'package:okito/okito.dart';

class AddCardController extends OkitoController {
  CardInfo? cardInfo;

  addPaymentMethod() {
    BankDetailsController().addPaymentMethod(this.cardInfo);
  }
}
