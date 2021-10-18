import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/jobs/explore/explore_screen/explore_screen_controller.dart';
import 'package:arcopen_employee/widgets/misc/page_skeleton.dart';
import 'package:arcopen_employee/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
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
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      ExploreScreenController.shared.loadJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: ExploreScreenController.shared,
      builder: () {
        final controller = ExploreScreenController.shared;
        return RefreshIndicator(
          onRefresh: controller.loadJobs,
          child: SingleChildScrollView(
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
                        // KTextField.circular(
                        //   hintText: "Search",
                        //   controller: controller.searchController,
                        //   leading: PhosphorIcons.magnifying_glass,
                        // ),
                        // SizedBox(height: 15),
                        Wrap(
                          children: [
                            // KChip(
                            //   title: "Location",
                            //   icon: PhosphorIcons.map_pin_fill,
                            //   onTap: () {
                            //     KRouter().push(KRoutes.locationFilterRoute);
                            //   },
                            // ),
                            // SizedBox(width: 10),
                            KChip(
                              title: "Filter",
                              icon: PhosphorIcons.funnel_fill,
                              onTap: () {
                                Okito.pushNamed(KRoutes.filterRoute).then((value) {
                                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                                    if (value != null) controller.filterJobs(filters: value);
                                  });
                                });
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
                  PageSkeleton(
                    child: Column(
                      children: [
                        if (controller.recommendedJobs.isNotEmpty) ...[
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
                                        Okito.pushNamed(KRoutes.jobDetailsRoute, arguments: {
                                          "job": job,
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SectionTitle(title: "JOBS"),
                              if (controller.jobList.isEmpty)
                                EmptyState()
                              else
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
                    ),
                    controller: controller,
                    retryCallback: controller.loadJobs,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
