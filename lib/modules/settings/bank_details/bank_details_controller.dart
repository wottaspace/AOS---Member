import 'package:arcopen_employee/constants/app_constants.dart';
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

  final PaymentController paymentController = PaymentController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CardInfo? cardInfo;

  // Payment methods management
  List<PaymentCard> getPaymentMethods() {
    return (KStorage().read<List<dynamic>>(key: AppConstants.paymentMethodsKey) ?? [])
        .cast<Map<String, dynamic>>()
        .map(
          (e) => PaymentCard.fromJson(e),
        )
        .toList();
  }

  void addPaymentMethod(CardInfo? cardInfo) {
    if (cardInfo != null) {
      var paymentMethods = this.getPaymentMethods();
      if (paymentMethods.where((element) => element.cardNumber == cardInfo.cardNumber).isNotEmpty) {
        this.showErrorToast("You've already added this card.");
        return;
      }
      if ((int.tryParse(cardInfo.validate!.split("/").first) ?? 0) > 12) {
        this.showErrorToast("Invalid validity date.");
        return;
      }
      paymentMethods.add(
        PaymentCard.fromJson({
          "cardNumber": cardInfo.cardNumber,
          "expirationMonth": cardInfo.validate!.split("/").first,
          "expirationYear": cardInfo.validate!.split("/").last,
        }),
      );

      _savePaymentMethods(paymentMethods);
      paymentController.getPaymentMethods();
      Okito.pop();
      this.showSuccessToast("Payment method successfully added.");
    } else {
      this.showErrorToast("Please fill all the card info.");
    }
  }

  void removeCard(PaymentCard e) {
    var paymentMethods = this.getPaymentMethods();
    paymentMethods.removeWhere((element) => element.cardNumber == e.cardNumber);
    _savePaymentMethods(paymentMethods);
    paymentController.getPaymentMethods();
    Okito.pop();
    this.showSuccessToast("Payment method successfully removed.");
  }

  _savePaymentMethods(List<PaymentCard> paymentMethods) {
    KStorage().write(key: AppConstants.paymentMethodsKey, value: paymentMethods.map((e) => e.toJson()).toList());
  }
}
