import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/jobs/explore/explore_screen/explore_screen_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';
import 'package:arcopen_employee/widgets/jobs/job_card.dart';
import 'package:arcopen_employee/widgets/jobs/recommended_job_card.dart';
import 'package:arcopen_employee/widgets/misc/k_chip.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:okito/okito.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ExploreScreenController controller = ExploreScreenController();

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
        Widget pageContent = SizedBox();

        Widget pageStateContainer(Widget child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
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
            pageContent = Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...controller.recommendedJobs.map(
                        (job) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RecommendedJobCard(
                            company: job.businessName,
                            title: "Posted by ${job.enquirerCompany}",
                            location: job.address,
                            onTap: () {
                              if (job.applied) {
                                Okito.pushNamed(KRoutes.jobDetailsRoute, arguments: {
                                  "job": job,
                                });
                              } else {
                                controller.showErrorToast("Sorry, you've already applied for this job.");
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: "JOBS"),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.jobList.length,
                        itemBuilder: (context, index) {
                          final Job job = controller.jobList[index];

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
                      ),
                    ],
                  ),
                )
              ],
            );
            break;
          case LoadingState.pending:
            pageContent = SizedBox();
            break;
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KTextField.circular(
                        hintText: "Search",
                        controller: controller.searchController,
                        leading: PhosphorIcons.magnifying_glass,
                      ),
                      SizedBox(height: 15),
                      Wrap(
                        children: [
                          KChip(
                            title: "Location",
                            icon: PhosphorIcons.map_pin_fill,
                            onTap: () {
                              KRouter().push(KRoutes.locationFilterRoute);
                            },
                          ),
                          SizedBox(width: 10),
                          KChip(
                            title: "Filter",
                            icon: PhosphorIcons.funnel_fill,
                            onTap: () {
                              KRouter().push(KRoutes.filterRoute);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (controller.recommendedJobs.isNotEmpty) SectionTitle(title: "RECOMMENDED JOBS"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                pageContent,
              ],
            ),
          ),
        );
      },
    );
  }
}
