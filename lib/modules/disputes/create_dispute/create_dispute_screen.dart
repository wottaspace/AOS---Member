import 'dart:io';

import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/disputes/create_dispute/create_dispute_controller.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';

class CreateDisputeScreen extends StatefulWidget {
  const CreateDisputeScreen({Key? key}) : super(key: key);

  @override
  _CreateDisputeScreenState createState() => _CreateDisputeScreenState();
}

class _CreateDisputeScreenState extends State<CreateDisputeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F7FD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: ColorConstants.greyColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          KRouter().pop();
                        },
                        color: Colors.black,
                        icon: Icon(PhosphorIcons.caret_left_bold, size: 20),
                      ),
                      Expanded(
                        child: Text(
                          "Add Dispute",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      KButton.regular(
                        title: "SAVE DISPUTE",
                        onTap: CreateDisputeController.shared.createDispute,
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
              OkitoBuilder(
                controller: CreateDisputeController.shared,
                activateLifecycleForOtherControllers: true,
                builder: () {
                  final controller = CreateDisputeController.shared;
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          KTextField.soft(
                              label: "TITLE",
                              controller: controller.titleController,
                              withShadow: false,
                              validator: (value) {
                                return controller.validateRequired(fieldName: "title", value: value);
                              }),
                          const SizedBox(height: 20),
                          KTextField.soft(
                            label: "SELECT JOB",
                            controller: controller.jobController,
                            hintText: controller.pastJobs.isEmpty ? "NO JOBS YET" : "",
                            onTap: controller.pastJobs.isEmpty
                                ? null
                                : () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SectionTitle(title: "Choose a job"),
                                              Expanded(
                                                child: ListView.builder(
                                                  itemCount: controller.pastJobs.length,
                                                  itemBuilder: (context, index) {
                                                    final Job job = controller.pastJobs[index];
                                                    return ListTile(
                                                      title: Text(job.businessName),
                                                      subtitle: Text(job.address),
                                                      onTap: () {
                                                        Okito.pop(result: job);
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ).then((value) {
                                      if (value != null) {
                                        controller.selectedJob = value as Job;
                                      }
                                    });
                                  },
                            readOnly: true,
                            withShadow: false,
                            suffixIcon: PhosphorIcons.caret_down_bold,
                          ),
                          const SizedBox(height: 20),
                          KTextField.soft(
                              label: "DETAILS",
                              controller: controller.detailsController,
                              withShadow: false,
                              minLines: 5,
                              maxLines: 5,
                              validator: (value) {
                                return controller.validateRequired(fieldName: "details", value: value);
                              }),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "ADD IMAGES",
                                  style: Okito.theme.textTheme.bodyText2!.copyWith(
                                    color: ColorConstants.greyColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: controller.pickImages,
                                iconSize: 20,
                                color: ColorConstants.greyColor,
                                icon: const Icon(PhosphorIcons.camera_bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          if (controller.images.isEmpty)
                            SizedBox(
                              height: Okito.height * 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Tap the camera icon to add images.",
                                    style: Okito.theme.textTheme.bodyText2!.copyWith(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            )
                          else
                            GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: controller.images.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final File image = controller.images[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: FileImage(image),
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
