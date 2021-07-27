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
  List<bool> _isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              height: 40,
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(8.0),
                borderWidth: 0,
                borderColor: Okito.theme.primaryColor,
                onPressed: (index) {
                  setState(() {
                    _isSelected = [false, false, false];
                    _isSelected[index] = true;
                  });
                },
                children: [
                  Container(
                    color: _isSelected[0] ? Okito.theme.primaryColor : Colors.white,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    child: Text(
                      "Invites",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _isSelected[0] ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                  Container(
                    color: _isSelected[1] ? Okito.theme.primaryColor : Colors.white,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    child: Text(
                      "TimeSheets",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _isSelected[1] ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                  Container(
                    color: _isSelected[2] ? Okito.theme.primaryColor : Colors.white,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    child: Text(
                      "History",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _isSelected[2] ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                ],
                isSelected: _isSelected,
              ),
            ),
            SizedBox(height: 20),
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
        ),
      ),
    );
  }
}
