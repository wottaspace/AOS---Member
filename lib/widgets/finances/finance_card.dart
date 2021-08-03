import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:simple_moment/simple_moment.dart';

class FinanceCard extends StatelessWidget {
  const FinanceCard({
    Key? key,
    required this.createdAt,
    required this.company,
    required this.jobTitle,
    required this.onTap,
    this.status,
  }) : super(key: key);

  final String company;
  final String jobTitle;
  final DateTime createdAt;
  final VoidCallback onTap;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2.0,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
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
                      "${Moment.fromDate(createdAt).format("dd MMM, yyyy")}",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.greyColor,
                      ),
                    ),
                    if (status != null) ...[
                      Spacer(),
                      Text(
                        "$status",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                          color: status == "PAID" ? ColorConstants.greenColor : ColorConstants.red,
                        ),
                      )
                    ]
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "$jobTitle",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "\$130.99",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.greenColor,
                      ),
                    )
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
                              Icon(PhosphorIcons.star_fill, color: ColorConstants.yellow, size: 10),
                              Icon(PhosphorIcons.star_fill, color: ColorConstants.yellow, size: 10),
                              Icon(PhosphorIcons.star_fill, color: ColorConstants.yellow, size: 10),
                              Icon(PhosphorIcons.star_fill, color: ColorConstants.yellow, size: 10),
                              Icon(PhosphorIcons.star, color: ColorConstants.yellow, size: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Invoice",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 10.0,
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
      ),
    );
  }
}
