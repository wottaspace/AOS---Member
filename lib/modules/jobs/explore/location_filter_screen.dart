import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';
import 'package:openarc_employee/widgets/navigation/k_app_bar.dart';

class LocationFilterScreen extends StatefulWidget {
  const LocationFilterScreen({Key? key}) : super(key: key);

  @override
  _LocationFilterScreenState createState() => _LocationFilterScreenState();
}

class _LocationFilterScreenState extends State<LocationFilterScreen> {
  final TextEditingController _searchController = TextEditingController();

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
                  KTextField.circular(
                    hintText: "Search",
                    leading: PhosphorIcons.magnifying_glass,
                    controller: _searchController,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "LOCATION",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      fontSize: 10.0,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.greyColor,
                    ),
                  ),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        value: index.isEven,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          "London (Greater London)",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (value) {
                          print(value);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: KButton.outlined(
          onPressed: () {},
          title: "DONE",
          color: Okito.theme.primaryColor,
        ),
      ),
    );
  }
}
