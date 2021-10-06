import 'package:arcopen_employee/core/models/payment_card.dart';
import 'package:arcopen_employee/core/models/plan.dart';
import 'package:arcopen_employee/http/requests/base_request.dart';
import 'package:dio/dio.dart';

class PaySubscriptionRequest extends BaseRequest {
  PaySubscriptionRequest({
    required this.card,
    required this.plan,
    required this.cycle,
    required this.cvv,
  });

  final PaymentCard card;
  final Plan plan;
  final String cycle;
  final String cvv;

  Map<String, dynamic> toJson() {
    return {
      "plan_id": plan.planId.toString(),
      "billing_cycle": cycle,
      "card_number": card.cardNumber.split(" ").join(""),
      "exp_month": card.expirationMonth,
      "exp_year": card.expirationYear,
      "cvv": cvv,
    };
  }

  FormData toFormData() {
    final data = FormData.fromMap(this.toJson());
    return data;
  }
}
