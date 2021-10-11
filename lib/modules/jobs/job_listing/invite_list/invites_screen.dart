import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/jobs/job_listing/invite_list/job_invites_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/widgets/jobs/job_card.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:okito/okito.dart';

class InvitesScreen extends StatefulWidget {
  const InvitesScreen({Key? key}) : super(key: key);

  @override
  _InvitesScreenState createState() => _InvitesScreenState();
}

class _InvitesScreenState extends State<InvitesScreen> {
  final JobInvitesController controller = JobInvitesController();
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
            pageContent = controller.jobs.isEmpty
                ? pageStateContainer(EmptyState())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.jobs.length,
                    itemBuilder: (context, index) {
                      final Job job = controller.jobs[index];
                      return JobCard(
                        jobSaved: false,
                        applicantCount: job.applicantsCount ?? 0,
                        company: job.businessName,
                        dateRange: "${job.startDate.split(", ").last} - ${job.endDate.split(", ").last}",
                        employmentType: job.jobType,
                        isNightlyJob: job.shiftType != "Day",
                        location: job.address,
                        payRate: job.budget.isEmpty ? "unknown" : job.budget,
                        postedAt: job.createdAt.split(" ").reversed.skip(2).toList().reversed.join(" "),
                        employeePhotoUrl: job.profilePic,
                        onTap: () {
                          KRouter().push(KRoutes.jobDetailsRoute, args: {
                            "canDecline": true,
                            "job": job,
                          });
                        },
                        jobId: 5,
                      );
                    },
                  );
            break;
          case LoadingState.pending:
            pageContent = const SizedBox();
            break;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "JOB LISTINGS"),
            SizedBox(height: 10),
            pageContent,
          ],
        );
      },
    );
  }
}
