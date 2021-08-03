import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/misc/section_title.dart';
import 'package:openarc_employee/widgets/navigation/k_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Okito.theme.textTheme.bodyText2!;
    return Scaffold(
      appBar: KAppBar(
        title: "Settings",
      ),
      backgroundColor: ColorConstants.lightBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              ListTile(
                dense: true,
                onTap: () {
                  KRouter().push(KRoutes.bankDetailsRoute);
                },
                title: Text(
                  "Bank details",
                  style: titleStyle,
                ),
                trailing: Icon(PhosphorIcons.caret_right, size: 15),
              ),
              Divider(),
              ListTile(
                dense: true,
                onTap: () {
                  KRouter().push(KRoutes.changePasswordRoute);
                },
                title: Text(
                  "Change password",
                  style: titleStyle,
                ),
                trailing: Icon(PhosphorIcons.caret_right, size: 15),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SectionTitle(title: "LEGAL", hasBoldTitle: true),
              ),
              ListTile(
                dense: true,
                onTap: () {},
                title: Text(
                  "Privacy Policy",
                  style: titleStyle,
                ),
                trailing: Icon(PhosphorIcons.share, size: 15),
              ),
              Divider(),
              ListTile(
                dense: true,
                onTap: () {},
                title: Text(
                  "Accessibility",
                  style: titleStyle,
                ),
                trailing: Icon(PhosphorIcons.share, size: 15),
              ),
              Divider(),
              ListTile(
                dense: true,
                onTap: () {},
                title: Text(
                  "Terms of service",
                  style: titleStyle,
                ),
                trailing: Icon(PhosphorIcons.share, size: 15),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}