import 'package:arcopen_employee/modules/auth/subscription/subscription_controller.dart';
import 'package:arcopen_employee/widgets/misc/page_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';
import 'package:arcopen_employee/widgets/subscription/pack_item.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({Key? key}) : super(key: key);

  @override
  _ChoosePlanScreenState createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  final SubscriptionController controller = SubscriptionController();

  late PageController _pageController;
  late int _selectedIndex;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: 1,
    );
    _selectedIndex = 0;
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: Scaffold(
        appBar: KAppBar(
          title: "Subscription",
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: OkitoBuilder(
              controller: controller,
              builder: () {
                return PageSkeleton(
                  child: Column(
                    children: [
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Container(
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
                            Text(
                              "Charge on link up",
                              style: Okito.theme.textTheme.bodyText1,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Gold inquirer has a little charge like 27p on linkup",
                              style: Okito.theme.textTheme.bodyText2!.copyWith(color: ColorConstants.greyColor),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...controller.subscriptionPlans.map((e) {
                            final bool isActive = _selectedIndex == controller.subscriptionPlans.indexOf(e);
                            return Row(
                              children: [
                                CircleAvatar(maxRadius: 4, backgroundColor: isActive ? Okito.theme.primaryColor : ColorConstants.lightBlue),
                                const SizedBox(width: 5),
                              ],
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 200,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          children: [
                            ...controller.subscriptionPlans.map((e) {
                              return PackItem(
                                label: e.name.toUpperCase(),
                                durationUnit: e.planType,
                                durationValue: "",
                                discount: e.discount,
                                frequency: e.yearlyPrice,
                                price: e.monthlyPrice ?? "\$0.00flat",
                                highlightTitle: _selectedIndex == controller.subscriptionPlans.indexOf(e),
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = controller.subscriptionPlans.indexOf(e);
                                  });
                                },
                              );
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                  controller: controller,
                  retryCallback: controller.loadData,
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12.0),
          child: KButton.outlined(
            onPressed: () {
              final choosenPlan = controller.subscriptionPlans[_selectedIndex];
              if (controller.activePlan?.planId == choosenPlan.planId) {
                controller.showWarningToast("The selected plan is the active plan.");
                return;
              }
              Okito.pushNamed(KRoutes.upgradePlanRoute, arguments: {
                "plan": choosenPlan,
              });
            },
            title: "CONTINUE",
            color: Okito.theme.primaryColor,
          ),
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
