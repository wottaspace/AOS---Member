import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/jobs/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/modules/jobs/job_details/accept_job_screen.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/misc/info_field.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:arcopen_employee/widgets/navigation/expanded_app_bar.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late bool actionsVisible;
  final JobDetailsController controller = JobDetailsController();

  @override
  void initState() {
    actionsVisible = true;
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: controller,
      builder: () {
        if (controller.job == null) return SizedBox();
        final Job job = controller.job!;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Okito.theme.primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandedAppBar(
                      jobTitle: job.city,
                      company: job.businessName,
                      location: job.address,
                      shiftType: job.shiftType,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(title: "DESCRIPTION"),
                          SizedBox(height: 10),
                          Text(
                            job.jobDescription,
                            style: Okito.theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 20),
                          InfoField(
                            title: "JOB TYPE",
                            contentTitle: job.jobType,
                            contentSubtitle: job.jobCategory,
                            leading: Icon(
                              PhosphorIcons.calendar,
                              color: Okito.theme.primaryColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          InfoField(
                            title: "PAY RATE",
                            contentTitle: job.budget,
                            leading: Icon(
                              PhosphorIcons.calendar,
                              color: Okito.theme.primaryColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: InfoField(
                                  title: "START DATE",
                                  contentTitle: job.startDate,
                                  leading: Icon(
                                    PhosphorIcons.calendar,
                                    color: Okito.theme.primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: InfoField(
                                  title: "END DATE",
                                  contentTitle: job.endDate,
                                  leading: Icon(
                                    PhosphorIcons.calendar,
                                    color: Okito.theme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: InfoField(
                                  title: "START TIME",
                                  contentTitle: job.shiftStartTime,
                                  leading: Icon(
                                    PhosphorIcons.calendar,
                                    color: Okito.theme.primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: InfoField(
                                  title: "END TIME",
                                  contentTitle: job.shiftEndTime,
                                  leading: Icon(
                                    PhosphorIcons.calendar,
                                    color: Okito.theme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: actionsVisible
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!job.applied)
                          KButton(
                            expanded: true,
                            onPressed: () {
                              setState(() {
                                actionsVisible = false;
                              });
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AcceptJobScreen();
                                },
                              ).then((value) {
                                setState(() {
                                  actionsVisible = true;
                                });
                              });
                            },
                            title: "ACCEPT",
                            color: ColorConstants.greenColor,
                          ),
                        SizedBox(height: 5),
                        if (job.applied && Okito.arguments["canDecline"] != null)
                          Row(
                            children: [
                              Expanded(
                                child: KButton.outlined(
                                  onPressed: controller.declineJob,
                                  title: "DECLINE",
                                  color: ColorConstants.red,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
