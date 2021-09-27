import 'package:arcopen_employee/modules/auth/subscription/subscription_controller.dart';
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
      controller.getSubscriptionPlans();
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
                return Column(
                  children: [
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
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
                          SizedBox(height: 5),
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
                              SizedBox(width: 5),
                            ],
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: 20),
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
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12.0),
          child: KButton.outlined(
            onPressed: () {
              Okito.pushNamed(KRoutes.upgradePlanRoute, arguments: {
                "plan": controller.subscriptionPlans[_selectedIndex],
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
