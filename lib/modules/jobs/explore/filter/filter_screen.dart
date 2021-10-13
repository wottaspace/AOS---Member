import 'package:arcopen_employee/constants/job_contants.dart';
import 'package:arcopen_employee/modules/jobs/explore/filter/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final FilterController controller = FilterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlue,
      appBar: KAppBar(title: "Filter"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: OkitoBuilder(
            controller: controller,
            builder: () {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      SectionTitle(title: "PROXIMITY"),
                      ListView.builder(
                        itemCount: JobConstants.proximityValues.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final String proximity = JobConstants.proximityValues[index];
                          return CheckboxListTile(
                            value: controller.selectedProximity == proximity,
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
                                  controller.selectedProximity = proximity;
                                });
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      SectionTitle(title: "HOURLY RATE"),
                      ListView.builder(
                        itemCount: JobConstants.hourlyRateValues.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final String hourlyRate = JobConstants.hourlyRateValues[index];
                          return CheckboxListTile(
                            value: hourlyRate == controller.hourlyRate,
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              hourlyRate,
                              style: Okito.theme.textTheme.bodyText2!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) {
                              if (value!) {
                                setState(() {
                                  controller.hourlyRate = hourlyRate;
                                });
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      SectionTitle(title: "CATEGORY"),
                      ListView.builder(
                        itemCount: JobConstants.availableCategories.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final String category = JobConstants.availableCategories[index];
                          return CheckboxListTile(
                            dense: true,
                            value: controller.selectedCategories.contains(category),
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              category,
                              style: Okito.theme.textTheme.bodyText2!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) {
                              controller.selectCategory(category);
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: KButton.outlined(
          onPressed: () {
            Okito.pop(result: {
              "proximity": controller.selectedProximity,
              "hourly_rate": controller.hourlyRate,
              "category": controller.selectedCategories.toString(),
            });
          },
          title: "DONE",
          color: Okito.theme.primaryColor,
        ),
      ),
    );
  }
}
