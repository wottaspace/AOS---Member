import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/finances/detail_item.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class FinanceDetailsScreen extends StatefulWidget {
  const FinanceDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FinanceDetailsScreenState createState() => _FinanceDetailsScreenState();
}

class _FinanceDetailsScreenState extends State<FinanceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _titleStyle = Okito.theme.textTheme.bodyText2!.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return Scaffold(
      backgroundColor: ColorConstants.lightBlue,
      appBar: KAppBar(
        title: "Talwar's Residency",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color(0XFFE3F0E3),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "PAID : ",
                          style: _titleStyle,
                        ),
                        Text(
                          "Jan 15, 2021",
                          style: _titleStyle,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "FROM : ",
                          style: _titleStyle,
                        ),
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "TO : ",
                          style: _titleStyle,
                        ),
                        Text(
                          "Harry Sahir",
                          style: _titleStyle,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Details",
                style: Okito.theme.textTheme.bodyText2!.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              DetailItem(
                title: "Agreed Pay per hour",
                value: "\$12/hr",
                boldValue: true,
              ),
              DetailItem(
                title: "AOS Standard edition per hour",
                value: "\$0",
                boldValue: true,
              ),
              DetailItem(
                title: "AOS one of Misc Payment",
                value: "\$0",
                boldValue: true,
              ),
              DetailItem(
                title: "Total Worked Hours",
                value: "12",
                boldValue: true,
                boldTitle: true,
              ),
              DetailItem(
                title: "Total Pay",
                value: "\$144",
                boldValue: true,
                boldTitle: true,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Deductions",
                  style: Okito.theme.textTheme.bodyText2!.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              DetailItem(
                title: "*AOS Acccound Refunds",
                value: "\$0",
                boldValue: true,
              ),
              DetailItem(
                title: "Admin charges \$0.25/hr",
                value: "\$3",
                boldValue: true,
              ),
              DetailItem(
                title: "Net Pay",
                value: "\$198.50",
                boldValue: true,
                boldTitle: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: KButton(
          color: Okito.theme.primaryColor,
          onPressed: () {},
          title: "DOWNLOAD PAYSLIP",
        ),
      ),
    );
  }
}

