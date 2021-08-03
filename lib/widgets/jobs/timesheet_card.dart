import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/misc/active_ts_item.dart';
import 'package:openarc_employee/widgets/misc/section_title.dart';
import 'package:simple_moment/simple_moment.dart';

class TimesheetCard extends StatelessWidget {
  const TimesheetCard({
    Key? key,
    this.isActive = false,
    this.endTime,
    this.extraHours,
    this.startTime,
    this.totalHours,
    required this.createdAt,
    required this.jobTitle,
    required this.company,
    required this.location,
  }) : super(key: key);

  final DateTime createdAt;
  final String jobTitle;
  final String company;
  final String location;
  final bool isActive;
  final String? startTime;
  final String? endTime;
  final String? totalHours;
  final String? extraHours;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${Moment.fromDate(createdAt).format("dd MMM, yyyy").toUpperCase()}",
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
                color: ColorConstants.greyColor,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "$jobTitle",
                  style: Okito.theme.textTheme.bodyText2!.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text(
                  "${isActive ? "ACTIVE" : "INACTIVE"}",
                  style: Okito.theme.textTheme.bodyText2!.copyWith(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: isActive ? ColorConstants.greenColor : ColorConstants.red,
                  ),
                ),
                Container(
                  height: 10,
                  child: Switch(
                    value: isActive,
                    activeColor: ColorConstants.greenColor,
                    onChanged: (bool value) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$company",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(PhosphorIcons.map_pin, color: ColorConstants.greyColor, size: 10),
                          SizedBox(width: 5),
                          Text(
                            "$location",
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (isActive)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: "START TIME",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "$startTime")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: "END TIME",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "$endTime")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: "TOTAL HOURS",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "$totalHours")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: "EXTRA HOURS",
                        hasBoldTitle: true,
                      ),
                      SizedBox(height: 5),
                      ActiveTSItem(title: "$extraHours")
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

