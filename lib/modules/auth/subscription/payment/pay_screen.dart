import 'package:arcopen_employee/modules/auth/subscription/payment/payment_controller.dart';
import 'package:arcopen_employee/modules/partials/pay_body.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final PaymentController controller = PaymentController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.initialize();
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
                                "Select a billing cycle",
                                style: Okito.theme.textTheme.headline2!.copyWith(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Divider(),
                            ...controller.billingCycles.map<Widget>((cycle) {
                              return RadioListTile(
                                groupValue: controller.billingCycle,
                                value: cycle,
                                title: Text(cycle.capitalize),
                                onChanged: (String? cycle) {
                                  controller.setSelectedBillingCycle = cycle!;
                                },
                              );
                            }).toList()
                          ],
                        ),
                      ),
                    ),
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
                            PayBody(
                              paymentMethods: controller.paymentMethods,
                              onItemDeleted: () {
                                setState(() {});
                              },
                              onCvvChanged: (cvv) {
                                controller.cvv = cvv;
                              },
                              onItemAdded: () {
                                setState(() {});
                              },
                              onItemSelected: (e) {
                                controller.setSelectedPaymentMethod = e!;
                              },
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
                controller.paySubscription();
              },
              title: "PAY NOW",
            ),
          ),
        );
      },
    );
  }
}
