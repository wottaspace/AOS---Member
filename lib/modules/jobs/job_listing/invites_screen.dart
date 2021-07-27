import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/jobs/job_card.dart';

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
        Text(
          "JOB LISTINGS",
          style: Okito.theme.textTheme.bodyText2!.copyWith(
            fontSize: 10.0,
            letterSpacing: 1.3,
            fontWeight: FontWeight.w600,
            color: ColorConstants.greyColor,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return JobCard(
              applications: 4,
              company: "TG Minto",
              dateRange: "15 JAN - 18 JAN",
              employmentType: "Express employment",
              isNightlyJob: index.isEven,
              location: "KITCHENER",
              payRate: "\$25",
              postedAt: "Jan 05th, 2021",
              employeePhotoUrl: "adds",
              onTap: () {
                // TODO: go to job details
              },
            );
          },
        ),
      ],
    );
  }
}
