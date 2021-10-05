import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/core/models/payment_card.dart';
import 'package:arcopen_employee/modules/settings/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class PayBody extends StatefulWidget {
  const PayBody({
    Key? key,
    required this.paymentMethods,
    required this.onItemDeleted,
    required this.onItemSelected,
    required this.onItemAdded,
    required this.onCvvChanged,
    this.selectable = true,
  }) : super(key: key);

  final bool selectable;
  final List<PaymentCard> paymentMethods;
  final Function onItemDeleted;
  final Function onItemAdded;
  final Function(String) onCvvChanged;
  final Function(PaymentCard?) onItemSelected;

  @override
  _PayBodyState createState() => _PayBodyState();
}

class _PayBodyState extends State<PayBody> {
  PaymentCard? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.paymentMethods.map((e) {
          String protectedCardNumber = e.cardNumber.replaceRange(0, 14, "**** **** ****");
          String cardLabel = "";
          final String cardNumber = e.cardNumber.trim().split(" ").join("");
          if (cardNumber.contains(RegExp(r'^4[0-9]{6,}$'))) {
            cardLabel = "Visa";
          } else if (cardNumber.contains(RegExp(r"^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$"))) {
            cardLabel = "MasterCard";
          } else if (cardNumber.contains(RegExp(r"^3[47][0-9]{5,}$"))) {
            cardLabel = "American Express";
          } else if (cardNumber.contains(RegExp(r"^6(?:011|5[0-9]{2})[0-9]{3,}$"))) {
            cardLabel = "Discover";
          } else if (cardNumber.contains(RegExp(r"^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"))) {
            cardLabel = "Diners Club";
          } else if (cardNumber.contains(RegExp(r"^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"))) {
            cardLabel = "JCB";
          } else {
            cardLabel = "Unkown";
          }

          return Column(
            children: [
              Divider(),
              InkWell(
                onLongPress: () {
                  showAdaptiveActionSheet(
                    context: context,
                    title: const Text("Options"),
                    actions: <BottomSheetAction>[],
                    cancelAction: CancelAction(
                      title: Text(
                        "Remove card",
                        style: TextStyle(color: ColorConstants.red),
                      ),
                      onPressed: () {
                        BankDetailsController().removeCard(e);
                      },
                    ),
                  ).then((value) {
                    widget.onItemDeleted();
                    _selectedItem = null;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 40,
                            child: Image.asset("assets/images/bank/${cardLabel.replaceAll(" ", "-").toLowerCase()}-logo.png"),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: RadioListTile<PaymentCard>(
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: e,
                              groupValue: _selectedItem,
                              toggleable: widget.selectable,
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                                widget.onItemSelected(value);
                              },
                              title: Text("$cardLabel $protectedCardNumber"),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "For security reasons, please enter your cvv",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      SizedBox(height: 10),
                      if (_selectedItem == e)
                        SizedBox(
                          width: 45,
                          height: 40,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            onChanged: widget.onCvvChanged,
                            decoration: InputDecoration(
                              hintText: "123",
                              hintStyle: TextStyle(fontSize: 12.0),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.greyColor.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Icon(
                PhosphorIcons.credit_card_fill,
                color: ColorConstants.greyColor,
              ),
              SizedBox(width: 20),
              Expanded(
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: false,
                  groupValue: true,
                  onChanged: (value) {
                    Okito.pushNamed(KRoutes.addPaymentMethodRoute).then((value) {
                      widget.onItemAdded();
                    });
                  },
                  title: Text("Add Card"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
