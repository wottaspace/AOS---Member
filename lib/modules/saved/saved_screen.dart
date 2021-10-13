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
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      SavedScreenController.shared.getSavedJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: SavedScreenController.shared,
      builder: () {
        Widget pageContent = const SizedBox();

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

        switch (SavedScreenController.shared.jobLoadingState) {
          case LoadingState.failed:
            pageContent = pageStateContainer(
              KButton(
                onPressed: SavedScreenController.shared.getSavedJobs,
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
            pageContent = SavedScreenController.shared.jobs.isEmpty
                ? pageStateContainer(EmptyState())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: SavedScreenController.shared.jobs.length,
                    itemBuilder: (context, index) {
                      final Job job = SavedScreenController.shared.jobs[index];

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
                        instanceId: job.instanceId,
                      );
                    },
                  );
            break;
          case LoadingState.pending:
            pageContent = const SizedBox();
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
