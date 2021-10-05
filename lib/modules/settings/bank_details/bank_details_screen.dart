import 'package:arcopen_employee/modules/partials/pay_body.dart';
import 'package:arcopen_employee/modules/settings/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final BankDetailsController controller = BankDetailsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Bank Details",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                PayBody(
                  paymentMethods: controller.getPaymentMethods(),
                  onItemDeleted: () {
                    setState(() {});
                  },
                  onItemAdded: () {
                    setState(() {});
                  },
                  selectable: false,
                  onCvvChanged: (cvv) {
                    print(cvv);
                  },
                  onItemSelected: (e) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
