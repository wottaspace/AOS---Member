import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/misc/k_chip.dart';
import 'package:openarc_employee/widgets/navigation/k_app_bar.dart';
import 'package:openarc_employee/widgets/subscription/pack_item.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({Key? key}) : super(key: key);

  @override
  _UpgradePlanScreenState createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Subscription",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.0) + EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Okito.theme.primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "MEMBER",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 10.0,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "You are currently subscribed to our enquirer plan but you can upgrade anytime.",
                    style: Okito.theme.textTheme.bodyText2,
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.purple.withOpacity(0.15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        PhosphorIcons.link_simple,
                        color: ColorConstants.purple,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Charge on link up",
                          style: Okito.theme.textTheme.bodyText1,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Gold inquirer has a little charge like 27p on linkup",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(color: ColorConstants.greyColor),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: PackItem(
                            label: "FREE",
                            durationUnit: "month",
                            durationValue: "3",
                            discount: "FREE TRIAL",
                            frequency: "first 3 mos",
                            price: "\$0.00flat",
                            highlightTitle: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.0),
        child: KButton(
          onPressed: () {},
          title: "UPGRADE NOW",
          color: ColorConstants.greenColor,
        ),
      ),
    );
  }
}
