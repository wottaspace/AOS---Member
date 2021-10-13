import 'package:arcopen_employee/core/models/complaint.dart';
import 'package:arcopen_employee/modules/disputes/dispute_details/dispute_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_employee/widgets/misc/info_field.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';
import 'package:okito/okito.dart';

class DisputeDetailsScreen extends StatefulWidget {
  const DisputeDetailsScreen({Key? key}) : super(key: key);

  @override
  _DisputeDetailsScreenState createState() => _DisputeDetailsScreenState();
}

class _DisputeDetailsScreenState extends State<DisputeDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      DisputeDetailsController.shared.loadJobDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Damage Property",
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: OkitoBuilder(
              controller: DisputeDetailsController.shared,
              builder: () {
                final Complaint dispute = Okito.arguments["dispute"];

                return Column(
                  children: [
                    const SizedBox(height: 20),
                    InfoField(title: "TITLE", contentTitle: dispute.title),
                    if (DisputeDetailsController.shared.jobDetails != null) ...[
                      const SizedBox(height: 20),
                      InfoField(title: "SELECT JOB", contentTitle: DisputeDetailsController.shared.jobDetails!.businessName),
                    ],
                    const SizedBox(height: 20),
                    InfoField(
                      title: "DETAILS",
                      contentTitle: dispute.details,
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
