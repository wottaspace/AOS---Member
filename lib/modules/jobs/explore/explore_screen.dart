import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';
import 'package:openarc_employee/widgets/jobs/job_card.dart';
import 'package:openarc_employee/widgets/jobs/recommended_job_card.dart';
import 'package:openarc_employee/widgets/misc/k_chip.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    controller: _searchController,
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
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "RECOMMENDED JOBS",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      fontSize: 10.0,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RecommendedJobCard(
                      company: "Zehr",
                      location: "Kitchener",
                      title: "Retail Shop guard",
                    ),
                  ),
                  RecommendedJobCard(
                    company: "BMO",
                    title: "Bank security guard",
                    location: "Waterbloq",
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
                  Text(
                    "JOBS",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      fontSize: 10.0,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.greyColor,
                    ),
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
