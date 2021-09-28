import 'package:arcopen_employee/core/models/payment_card.dart';
import 'package:arcopen_employee/modules/auth/subscription/payment/payment_controller.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:credit_card_input_form/model/card_info.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class BankDetailsController extends OkitoController with ToastMixin {
  BankDetailsController._internal();

  static final BankDetailsController _singleton = BankDetailsController._internal();

  factory BankDetailsController() {
    return _singleton;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String paymentMethodsKey = "payment_methods";

  CardInfo? cardInfo;

  // Payment methods management
  List<PaymentCard> getPaymentMethods() {
    return KStorage().read<List<PaymentCard>>(key: paymentMethodsKey) ?? [];
  }

  void addPaymentMethod() {
    if (cardInfo != null) {
      var paymentMethods = this.getPaymentMethods();
      if (paymentMethods.where((element) => element.cardNumber == cardInfo!.cardNumber).isNotEmpty) {
        this.showErrorToast("You've already added this card.");
        return;
      }
      paymentMethods.add(
        PaymentCard.fromJson({
          "cardNumber": cardInfo!.cardNumber,
          "expirationMonth": cardInfo!.validate!.split("/").first,
          "expirationYear": cardInfo!.validate!.split("/").last,
        }),
      );

      KStorage().write(key: paymentMethodsKey, value: paymentMethods);
      Okito.pop();
      PaymentController().getPaymentMethods();
      this.showSuccessToast("Payment method successfully added.");
    } else {
      this.showErrorToast("Please fill all the card info.");
    }
  }

  void removeCard(e) {
    var paymentMethods = this.getPaymentMethods();
    paymentMethods.remove(e);
    PaymentController().getPaymentMethods();
    Okito.pop();
    this.showSuccessToast("Payment method successfully removed.");
  }
}
