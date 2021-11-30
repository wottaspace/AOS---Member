import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/http/responses/timesheet_job_response.dart';
import 'package:arcopen_employee/modules/jobs/job_listing/timesheets/job_timesheets_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_employee/widgets/jobs/timesheet_card.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:okito/okito.dart';

class TimesheetScreen extends StatefulWidget {
  const TimesheetScreen({Key? key}) : super(key: key);

  @override
  _TimesheetScreenState createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
  JobTimesheetsController controller = JobTimesheetsController();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.loadJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: controller,
      builder: () {
        Widget pageContent = const SizedBox();

        Widget pageStateContainer(Widget child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
          );
        }

        switch (controller.loadingState) {
          case LoadingState.failed:
            pageContent = pageStateContainer(
              KButton(
                onPressed: controller.loadJobs,
                title: "Try again",
                color: Okito.theme.primaryColor,
              ),
            );
            break;
          case LoadingState.loading:
            pageContent = pageStateContainer(
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
            break;
          case LoadingState.success:
            pageContent = SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  SectionTitle(title: "ACTIVE JOB"),
                  SizedBox(height: 10),
                  controller.activeJobs.isEmpty
                      ? Text("No active job found.")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.activeJobs.length,
                          itemBuilder: (context, index) {
                            final Job job = controller.activeJobs[index];
                            return TimesheetCard(
                              isActive: true,
                              startTime: job.shiftStartTime,
                              endTime: job.shiftEndTime,
                              extraHours: "-",
                              totalHours: "-",
                              createdAt: DateTime.now(),
                              jobTitle: job.jobType,
                              company: job.businessName,
                              companyName: job.enquirerCompany,
                            );
                          },
                        ),
                  SizedBox(height: 20),
                  SectionTitle(title: "UPCOMING JOBS"),
                  SizedBox(height: 10),
                  controller.upcomingJobs.isEmpty
                      ? Text("No upcoming job found.")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.upcomingJobs.length,
                          itemBuilder: (context, index) {
                            final UpcomingJob job = controller.upcomingJobs[index];
                            return TimesheetCard(
                              isActive: false,
                              startTime: "-",
                              endTime: "-",
                              extraHours: "-",
                              totalHours: "-",
                              createdAt: DateTime.now(),
                              jobTitle: "",
                              company: job.businessName,
                              companyName: job.companyName,
                              companyLogo: job.companyLogo,
                            );
                          },
                        ),
                ],
              ),
            );
            break;
          case LoadingState.pending:
            pageContent = const SizedBox();
            break;
        }
        return pageContent;
      },
    );
  }
}
