import 'package:arcopen_employee/widgets/misc/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/dialogs/invoice_details_dialog.dart';

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
  final String createdAt;
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
                      "$createdAt",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.greyColor,
                      ),
                    ),
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
                          RatingStars(score: 4.5),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      KRouter().pop();
                                    },
                                    iconSize: 10,
                                    icon: Icon(PhosphorIcons.x_bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Talwar's Residency",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                              content: InvoiceDetailsDialog(),
                            );
                          },
                        );
                      },
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
