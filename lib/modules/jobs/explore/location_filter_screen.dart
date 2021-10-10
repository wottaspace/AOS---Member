import 'package:arcopen_employee/constants/job_contants.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';

import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class LocationFilterScreen extends StatefulWidget {
  const LocationFilterScreen({Key? key}) : super(key: key);

  @override
  _LocationFilterScreenState createState() => _LocationFilterScreenState();
}

class _LocationFilterScreenState extends State<LocationFilterScreen> {
  String? selectedProximity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlue,
      appBar: KAppBar(title: "Location"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  SectionTitle(title: "LOCATION"),
                  ListView.builder(
                    itemCount: JobConstants.proximityValues.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final String proximity = JobConstants.proximityValues[index];
                      return CheckboxListTile(
                        value: selectedProximity == proximity,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          proximity,
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        dense: true,
                        onChanged: (value) {
                          if (value!) {
                            setState(() {
                              selectedProximity = proximity;
                            });
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: KButton.outlined(
          onPressed: () {
            Okito.pop(result: {
              "proximity": selectedProximity,
            });
          },
          title: "DONE",
          color: Okito.theme.primaryColor,
        ),
      ),
    );
  }
}
