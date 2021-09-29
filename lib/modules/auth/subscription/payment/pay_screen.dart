import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/core/models/payment_card.dart';
import 'package:arcopen_employee/modules/auth/subscription/payment/payment_controller.dart';
import 'package:arcopen_employee/modules/settings/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final PaymentController controller = PaymentController();

  PaymentCard? _selectedItem;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getPaymentMethods();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: controller,
      builder: () {
        return Scaffold(
          appBar: KAppBar(
            title: "Subscription",
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Select your payment method",
                                style: Okito.theme.textTheme.headline2!.copyWith(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            ...controller.paymentMethods.map((e) {
                              String cardNumber = e.cardNumber.replaceRange(0, 14, "**** **** ****");
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
                                        _selectedItem = null;
                                        setState(() {});
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
                                                child: Image.asset("assets/images/visa-logo.jpg"),
                                              ),
                                              SizedBox(width: 20),
                                              Expanded(
                                                child: RadioListTile(
                                                  contentPadding: EdgeInsets.zero,
                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                  value: e,
                                                  groupValue: _selectedItem,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selectedItem = e;
                                                    });
                                                  },
                                                  title: Text("Visa $cardNumber"),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "For security reasons, please enter your cvv",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            width: 45,
                                            height: 40,
                                            child: TextField(
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
                                        Okito.pushNamed(KRoutes.bankDetailsRoute).then((value) {
                                          setState(() {});
                                        });
                                      },
                                      title: Text("Add Card"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(16.0),
            child: KButton(
              color: ColorConstants.greenColor,
              onPressed: () {
                controller.paySubscription(_selectedItem);
              },
              title: "PAY NOW",
            ),
          ),
        );
      },
    );
  }
}
