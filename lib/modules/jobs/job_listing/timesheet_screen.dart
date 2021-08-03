import 'package:flutter/material.dart';
import 'package:openarc_employee/widgets/jobs/timesheet_card.dart';
import 'package:openarc_employee/widgets/misc/section_title.dart';

class TimesheetScreen extends StatefulWidget {
  const TimesheetScreen({Key? key}) : super(key: key);

  @override
  _TimesheetScreenState createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        SectionTitle(title: "ACTIVE JOB"),
        SizedBox(height: 10),
        TimesheetCard(
          isActive: true,
          startTime: "07 AM",
          endTime: "-",
          extraHours: "-",
          totalHours: "-",
          createdAt: DateTime.now(),
          jobTitle: "Talwar's Residency",
          company: "Express Employment",
          location: "KITCHENER",
        ),
        SizedBox(height: 20),
        SectionTitle(title: "UPCOMING JOBS"),
        SizedBox(height: 10),
         TimesheetCard(
          isActive: false,
          startTime: "07 AM",
          endTime: "-",
          extraHours: "-",
          totalHours: "-",
          createdAt: DateTime.now(),
          jobTitle: "Talwar's Residency",
          company: "Express Employment",
          location: "KITCHENER",
        ),
      ],
    );
  }
}
