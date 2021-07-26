import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.applications,
    required this.company,
    required this.dateRange,
    required this.employmentType,
    required this.isNightlyJob,
    required this.location,
    required this.payRate,
    required this.postedAt,
    required this.employeePhotoUrl,
    required this.onTap,
  }) : super(key: key);

  final String dateRange;
  final bool isNightlyJob;
  final String payRate;
  final String postedAt;
  final int applications;
  final String company;
  final String location;
  final String employmentType;
  final String employeePhotoUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 2.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "$dateRange",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 12.0,
                          color: ColorConstants.greyColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset("assets/images/${isNightlyJob ? 'night.png' : 'sun.png'}"),
                      Spacer(),
                      RichText(
                        text: TextSpan(
                          text: "$payRate",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            fontSize: 12.0,
                            color: Okito.theme.primaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: "/hr",
                              style: Okito.theme.textTheme.bodyText2!.copyWith(
                                color: ColorConstants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "$company",
                    style: Okito.theme.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CircleAvatar(maxRadius: 20),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$employmentType",
                            style: Okito.theme.textTheme.bodyText2,
                          ),
                          SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(PhosphorIcons.map_pin_fill, size: 10, color: ColorConstants.greyColor),
                              SizedBox(width: 5),
                              Text(
                                "$location",
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.3,
                                  color: ColorConstants.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          PhosphorIcons.heart,
                          size: 20,
                          color: ColorConstants.greyColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Posted at ",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "$postedAt",
                              style: Okito.theme.textTheme.bodyText2!.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "$applications people applied",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
