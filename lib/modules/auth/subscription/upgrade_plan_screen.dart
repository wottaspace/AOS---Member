import 'package:arcopen_employee/core/models/plan.dart';
import 'package:arcopen_employee/modules/auth/subscription/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';
import 'package:arcopen_employee/widgets/subscription/pack_item.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({Key? key}) : super(key: key);

  @override
  _UpgradePlanScreenState createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  final SubscriptionController controller = SubscriptionController();
  Plan? plan;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        plan = Okito.arguments["plan"];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Subscription",
      ),
      body: SingleChildScrollView(
        child: OkitoBuilder(
          controller: controller,
          builder: () {
            return Column(
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
                      const SizedBox(height: 10),
                      Text(
                        "You are currently subscribed to our enquirer plan but you can upgrade anytime.",
                        style: Okito.theme.textTheme.bodyText2,
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              "Charge on link up",
                              style: Okito.theme.textTheme.bodyText1,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Gold inquirer has a little charge like 27p on linkup",
                              style: Okito.theme.textTheme.bodyText2!.copyWith(color: ColorConstants.greyColor),
                            ),
                            if (plan != null)
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: PackItem(
                                  label: plan!.name.toUpperCase(),
                                  durationUnit: plan!.planType,
                                  durationValue: "",
                                  discount: plan!.discount,
                                  frequency: plan!.yearlyPrice,
                                  price: plan!.monthlyPrice ?? "\$0.00flat",
                                  highlightTitle: true,
                                  onTap: () {},
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.0),
        child: KButton(
          onPressed: () {
            if (plan != null) {
              SubscriptionController.shared.upgradePlan(plan!);
            }
          },
          title: "UPGRADE NOW",
          color: ColorConstants.greenColor,
        ),
      ),
    );
  }
}
