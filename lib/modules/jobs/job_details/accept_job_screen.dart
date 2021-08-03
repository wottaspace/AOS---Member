import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';

class AcceptJobScreen extends StatefulWidget {
  const AcceptJobScreen({Key? key}) : super(key: key);

  @override
  _AcceptJobScreenState createState() => _AcceptJobScreenState();
}

class _AcceptJobScreenState extends State<AcceptJobScreen> {
  final TextEditingController _payRateController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Spacer(flex: 2),
            KTextField.soft(
              label: "EXPECTED PAY RATE",
              controller: _payRateController,
              titleTextColor: Colors.white,
            ),
            SizedBox(height: 20),
            KTextField.soft(
              label: "MESSAGE TO EMPLOYER",
              controller: _messageController,
              minLines: 4,
              maxLines: 4,
              titleTextColor: Colors.white,
            ),
            Spacer(),
            KButton(
              expanded: true,
              onPressed: () {
                KRouter().push(KRoutes.applySuccessRoute);
              },
              title: "APPLY FOR THIS JOB",
              color: Okito.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
