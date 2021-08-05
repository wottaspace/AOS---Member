import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/modules/jobs/job_details/accept_job_screen.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/misc/info_field.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:arcopen_employee/widgets/navigation/expanded_app_bar.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late bool actionsVisible;

  @override
  void initState() {
    actionsVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Okito.theme.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpandedAppBar(
                  jobTitle: "Talwar's Residency",
                  company: "Express Security",
                  location: "Kitchener",
                  timeLeft: "7 Days",
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: "DESCRIPTION"),
                      SizedBox(height: 10),
                      Text(
                        "Looking for a gate security guard. Should have strong build, should be punctual, spontaneous, CRP certificate required. The shift would be from 11PM to 7AM in the morning",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 20),
                      InfoField(
                        title: "JOB TYPE",
                        contentTitle: "Contract",
                        contentSubtitle: "More than 30hrs/week and 1 month",
                        leading: Icon(
                          PhosphorIcons.calendar,
                          color: Okito.theme.primaryColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      InfoField(
                        title: "PAY RATE",
                        contentTitle: "\$12/hr",
                        leading: Icon(
                          PhosphorIcons.calendar,
                          color: Okito.theme.primaryColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: InfoField(
                              title: "START DATE",
                              contentTitle: "14/11/2020",
                              leading: Icon(
                                PhosphorIcons.calendar,
                                color: Okito.theme.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: InfoField(
                              title: "END DATE",
                              contentTitle: "14/01/2021",
                              leading: Icon(
                                PhosphorIcons.calendar,
                                color: Okito.theme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: InfoField(
                              title: "START TIME",
                              contentTitle: "07:00 AM",
                              leading: Icon(
                                PhosphorIcons.calendar,
                                color: Okito.theme.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: InfoField(
                              title: "END TIME",
                              contentTitle: "03:00 PM",
                              leading: Icon(
                                PhosphorIcons.calendar,
                                color: Okito.theme.primaryColor,
                              ),
                            ),
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
        bottomNavigationBar: actionsVisible
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    KButton(
                      expanded: true,
                      onPressed: () {
                        setState(() {
                          actionsVisible = false;
                        });
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AcceptJobScreen();
                          },
                        ).then((value) {
                          setState(() {
                            actionsVisible = true;
                          });
                        });
                      },
                      title: "ACCEPT",
                      color: ColorConstants.greenColor,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: KButton.outlined(
                            onPressed: () {},
                            title: "MESSAGE EMPLOYER",
                            color: Okito.theme.primaryColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: KButton.outlined(
                            onPressed: () {},
                            title: "DECLINE",
                            color: ColorConstants.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
