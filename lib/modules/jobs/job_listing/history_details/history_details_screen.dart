import 'package:arcopen_employee/widgets/misc/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/misc/active_ts_item.dart';
import 'package:arcopen_employee/widgets/misc/info_field.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class HistoryDetailsScreen extends StatefulWidget {
  const HistoryDetailsScreen({Key? key}) : super(key: key);

  @override
  _HistoryDetailsScreenState createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F7FD),
      appBar: KAppBar(
        title: "Talwar's Residency",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Express Employment",
                              style: Okito.theme.textTheme.bodyText2!.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            RatingStars(score: 4.5),
                          ],
                        ),
                      ),
                      Text(
                        "UNPAID",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Accepted on Jan 15, 2021"),
                  Text(
                    "\$100",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.greenColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SectionTitle(
                        title: "START TIME",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "7 AM")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SectionTitle(
                        title: "END TIME",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "4 PM")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SectionTitle(
                        title: "TOTAL HOURS",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "9 hrs")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SectionTitle(
                        title: "EXTRA HOURS",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "1 hr")
                    ],
                  ),
                ],
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
      ),
    );
  }
}
