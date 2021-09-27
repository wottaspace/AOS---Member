import 'package:flutter/material.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/widgets/jobs/job_card.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';

class InvitesScreen extends StatefulWidget {
  const InvitesScreen({Key? key}) : super(key: key);

  @override
  _InvitesScreenState createState() => _InvitesScreenState();
}

class _InvitesScreenState extends State<InvitesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "JOB LISTINGS"),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return JobCard(
              jobSaved: false,
              applicantCount: 2,
              company: "TG Minto",
              dateRange: "15 JAN - 18 JAN",
              employmentType: "Express employment",
              isNightlyJob: index.isEven,
              location: "KITCHENER",
              payRate: "\$25",
              postedAt: "Jan 05th, 2021",
              employeePhotoUrl: null,
              onTap: () {
                // TODO: go to job details
                KRouter().push(KRoutes.jobDetailsRoute);
              },
              jobId: 5,
            );
          },
        ),
      ],
    );
  }
}
