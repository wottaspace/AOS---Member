import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';

class ApplySuccessScreen extends StatefulWidget {
  const ApplySuccessScreen({Key? key}) : super(key: key);

  @override
  _ApplySuccessScreenState createState() => _ApplySuccessScreenState();
}

class _ApplySuccessScreenState extends State<ApplySuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: Okito.pop,
          icon: Icon(
            PhosphorIcons.caret_left_bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset("assets/images/tick.png"),
            SizedBox(height: 20),
            Text(
              "Successfully applied",
              style: Okito.theme.textTheme.headline2!.copyWith(fontSize: 14.0),
            ),
            SizedBox(height: 10),
            Text(
              "You have successfully apply for this job. Now the employer will look into your profile and try to connect with you if you are a fit for the job",
              textAlign: TextAlign.center,
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                color: ColorConstants.greyColor,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: KButton(
          color: Okito.theme.primaryColor,
          onPressed: () {
            Okito.popUntil(KRoutes.exploreRoute);
          },
          title: "BACK TO LISTINGS",
          expanded: true,
        ),
      ),
    );
  }
}
