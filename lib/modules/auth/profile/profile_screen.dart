import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';
import 'package:openarc_employee/widgets/misc/section_title.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _driveController = TextEditingController();
  final TextEditingController _badgeNumberController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _hourlyRateController = TextEditingController();
  final TextEditingController _unavailabilityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Okito.theme.textTheme.bodyText2!.copyWith(
      fontSize: 10.0,
      letterSpacing: 1.3,
      fontWeight: FontWeight.w600,
      color: ColorConstants.greyColor,
    );

    final List<_MenuItem> menuItems = [
      _MenuItem(onTap: () {}, title: "Edit Profile"),
      _MenuItem(onTap: () {}, title: "Logout"),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Okito.theme.primaryColor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(PhosphorIcons.caret_left_bold),
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Harry Sahir",
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Cambrigde: ON",
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuButton<int>(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              PhosphorIcons.dots_three_vertical_bold,
                              color: Colors.white,
                            ),
                          ),
                          onSelected: (int index) {
                            menuItems[index].onTap();
                          },
                          itemBuilder: (context) {
                            return List.generate(menuItems.length, (index) {
                              return PopupMenuItem(
                                value: index,
                                child: Text(menuItems[index].title),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: "ABOUT"),
                    SizedBox(height: 10),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Lorem ipsum dolor sit atmet, consectur adipiscing elit, sed do eiusmod tempor incicident ut labore et dolore magna aliqua",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SectionTitle(title: "RESUME/CV"),
                    SizedBox(height: 10),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset("assets/images/portfolio.png"),
                            SizedBox(height: 10),
                            Text(
                              "Add resume",
                              style: titleStyle.copyWith(fontSize: 12.0),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Add summary to make your profile look good. Add summary to make your profile look good. Add summary to make your profile look good.",
                              textAlign: TextAlign.center,
                              style: titleStyle.copyWith(
                                fontSize: 10.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 20),
                            KButton.outlined(
                              expanded: true,
                              onPressed: () {},
                              title: "ADD RESUME",
                              color: Okito.theme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 2.5,
                      ),
                      children: [
                        KTextField.soft(label: "DO YOU DRIVE ?", controller: _driveController),
                        KTextField.soft(label: "BADGE NUMBER", controller: _badgeNumberController),
                        KTextField.soft(label: "CONTACT*", controller: _contactController),
                        KTextField.soft(label: "HOURLY RATE", controller: _hourlyRateController),
                      ],
                    ),
                    SizedBox(height: 20),
                    KTextField.soft(
                      label: "UNAVAILABILITY",
                      suffixIcon: PhosphorIcons.calendar,
                      controller: _unavailabilityController,
                    ),
                    SizedBox(height: 20),
                    KTextField.soft(
                      label: "ADRESS",
                      controller: _addressController,
                    ),
                    SizedBox(height: 20),
                    GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 2.5,
                      ),
                      children: [
                        KTextField.soft(
                          label: "CITY",
                          controller: _cityController,
                        ),
                        KTextField.soft(
                          label: "POSTAL CODE",
                          controller: _postalCodeController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Okito.theme.primaryColor,
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final VoidCallback onTap;

  _MenuItem({
    required this.onTap,
    required this.title,
  });
}