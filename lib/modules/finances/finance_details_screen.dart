import 'package:arcopen_employee/core/models/transaction.dart';
import 'package:arcopen_employee/modules/finances/finance_details_controller.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:arcopen_employee/widgets/misc/rating_stars.dart';
import 'package:flutter/material.dart';
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
    final Transaction transaction = Okito.arguments["transaction"];
    final TextStyle _titleStyle = Okito.theme.textTheme.bodyText2!.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return Scaffold(
      backgroundColor: ColorConstants.lightBlue,
      appBar: KAppBar(
        title: transaction.businessName,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
                          transaction.paymentDate ?? "Pending payment",
                          style: _titleStyle,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "FROM : ",
                          style: _titleStyle,
                        ),
                        CircleAvatar(),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.memberName,
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              RatingStars(score: transaction.stars),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "TO : ",
                          style: _titleStyle,
                        ),
                        Text(
                          Okito.use<AuthService>().user.name,
                          style: _titleStyle,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Details",
                style: Okito.theme.textTheme.bodyText2!.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              DetailItem(
                title: "Total Pay",
                value: transaction.amountPaid,
                boldValue: true,
                boldTitle: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: KButton(
          color: Okito.theme.primaryColor,
          onPressed: () {
            FinanceDetailsController.shared.downloadInvoice(transaction.transactionId);
          },
          title: "DOWNLOAD PAYSLIP",
        ),
      ),
    );
  }
}

