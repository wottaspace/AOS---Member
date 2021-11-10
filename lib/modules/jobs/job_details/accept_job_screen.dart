import 'package:arcopen_employee/modules/jobs/job_details/job_details_controller.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';

class AcceptJobScreen extends StatefulWidget {
  const AcceptJobScreen({Key? key}) : super(key: key);

  @override
  _AcceptJobScreenState createState() => _AcceptJobScreenState();
}

class _AcceptJobScreenState extends State<AcceptJobScreen> with ValidationMixin {
  final JobDetailsController controller = JobDetailsController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.messageController.clear();
        controller.payRateController.clear();

        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.applyFormKey,
            child: Column(
              children: [
                Spacer(flex: 2),
                KTextField.soft(
                  label: "EXPECTED PAY RATE",
                  controller: controller.payRateController,
                  titleTextColor: Colors.white,
                  keybordType: TextInputType.number,
                ),
                SizedBox(height: 20),
                KTextField.soft(
                  label: "MESSAGE TO EMPLOYER",
                  controller: controller.messageController,
                  minLines: 4,
                  maxLines: 4,
                  titleTextColor: Colors.white,
                  validator: (String? message) {
                    return this.validateRequired(fieldName: "message", value: message);
                  },
                ),
                Spacer(),
                KButton(
                  expanded: true,
                  onPressed: () {
                    controller.applyForJob();
                  },
                  title: "APPLY FOR THIS JOB",
                  color: Okito.theme.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
