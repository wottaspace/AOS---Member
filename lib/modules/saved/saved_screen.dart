import 'package:flutter/material.dart';
import 'package:arcopen_employee/widgets/jobs/job_card.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "JOB LISTINGS"),
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
                  onActionTapped: () {},
                  status: index.isOdd ? "EXPIRED" : "ACTIVE",
                  liked: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
