import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/navigation/k_app_bar.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
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
                        Divider(),
                        Padding(
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
                                      value: true,
                                      groupValue: true,
                                      onChanged: (value) {},
                                      title: Text("Visa **** **** **** 2464"),
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
                                  onChanged: (value) {},
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
          onPressed: () {},
          title: "PAY NOW",
        ),
      ),
    );
  }
}
