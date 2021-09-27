import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/saved/saved_screen_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_employee/widgets/jobs/job_card.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:okito/okito.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final SavedScreenController controller = SavedScreenController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getSavedJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: controller,
      builder: () {
        Widget pageContent = SizedBox();

        Widget pageStateContainer(Widget child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
          );
        }

        switch (controller.jobLoadingState) {
          case LoadingState.failed:
            pageContent = pageStateContainer(
              KButton(
                onPressed: controller.getSavedJobs,
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

                      final String startRange = job.shiftStartDate.split(" ").reversed.skip(3).toList().reversed.join(" ").split(", ").last;
                      final String endRange = job.shiftEndDate.split(" ").reversed.skip(3).toList().reversed.join(" ").split(", ").last;
                      return JobCard(
                        jobSaved: job.saved,
                        applicantCount: job.applicantsCount ?? 0,
                        company: job.businessName,
                        dateRange: "$startRange - $endRange",
                        employmentType: job.jobType,
                        isNightlyJob: job.shiftType != "Day",
                        location: job.address,
                        payRate: job.budget,
                        postedAt: job.createdAt.split(" ").reversed.skip(2).toList().reversed.join(" "),
                        employeePhotoUrl: job.profilePic,
                        onTap: () {
                          Okito.pushNamed(KRoutes.jobDetailsRoute, arguments: {
                            "job": job,
                          });
                        },
                        jobId: job.id,
                      );
                    },
                  );
            break;
          case LoadingState.pending:
            pageContent = SizedBox();
            break;
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: "JOB LISTINGS"),
                pageContent,
              ],
            ),
          ),
        );
      },
    );
  }
}
