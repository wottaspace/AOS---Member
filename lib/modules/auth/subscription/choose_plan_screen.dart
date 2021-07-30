import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/navigation/k_app_bar.dart';
import 'package:openarc_employee/widgets/subscription/pack_item.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({Key? key}) : super(key: key);

  @override
  _ChoosePlanScreenState createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: 1,
    );
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
            child: Column(
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
                    CircleAvatar(maxRadius: 4, backgroundColor: ColorConstants.lightBlue),
                    SizedBox(width: 5),
                    CircleAvatar(maxRadius: 4.5),
                    SizedBox(width: 5),
                    CircleAvatar(maxRadius: 4, backgroundColor: ColorConstants.lightBlue),
                    SizedBox(width: 5),
                    CircleAvatar(maxRadius: 4, backgroundColor: ColorConstants.lightBlue),
                    SizedBox(width: 5),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    children: [
                      PackItem(
                        label: "FREE",
                        durationUnit: "month",
                        durationValue: "3",
                        discount: "FREE TRIAL",
                        frequency: "first 3 mos",
                        price: "\$0.00flat",
                      ),
                      PackItem(
                        label: "MEMBER",
                        discount: "SAVE 54%",
                        durationUnit: "month",
                        durationValue: "1",
                        frequency: "\$150/yearly",
                        price: "\$12.5 flat",
                      ),
                      PackItem(
                        label: "DOVE MEMBERS",
                        highlightTitle: true,
                        discount: "SAVE 42%",
                        durationUnit: "month",
                        durationValue: "1",
                        frequency: "\$105/yearly",
                        price: "\$15 flat",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12.0),
          child: KButton.outlined(
            onPressed: () {},
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
