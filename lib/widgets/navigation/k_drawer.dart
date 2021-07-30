import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/constants/color_constants.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Okito.theme.textTheme.bodyText2!.copyWith(fontSize: 16.0);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: ColorConstants.lightBlue,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        KRouter().pop();
                      },
                      icon: Icon(PhosphorIcons.x_bold, size: 25),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        KRouter().push(KRoutes.profileRoute);
                      },
                      child: CircleAvatar(
                        maxRadius: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ListTile(
                  dense: true,
                  onTap: () {
                    KRouter().push(KRoutes.choosePlanRoute);
                  },
                  leading: Icon(
                    PhosphorIcons.buildings_fill,
                    color: ColorConstants.darkBlue,
                    size: 20,
                  ),
                  title: Text(
                    "Subscription",
                    style: titleStyle,
                  ),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  leading: Icon(
                    PhosphorIcons.gear_fill,
                    color: ColorConstants.darkBlue,
                    size: 20,
                  ),
                  title: Text(
                    "Settings",
                    style: titleStyle,
                  ),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  leading: Icon(
                    PhosphorIcons.scales_bold,
                    color: ColorConstants.darkBlue,
                    size: 20,
                  ),
                  title: Text(
                    "Disputes",
                    style: titleStyle,
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  dense: true,
                  leading: Icon(
                    PhosphorIcons.lifebuoy_fill,
                    color: ColorConstants.darkBlue,
                    size: 20,
                  ),
                  title: Text(
                    "Support",
                    style: titleStyle,
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  dense: true,
                  leading: Icon(
                    PhosphorIcons.envelope_fill,
                    color: ColorConstants.darkBlue,
                    size: 20,
                  ),
                  title: Text(
                    "Invite Friends",
                    style: titleStyle,
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  dense: true,
                  leading: Icon(
                    PhosphorIcons.sign_out_fill,
                    color: ColorConstants.darkBlue,
                    size: 20,
                  ),
                  title: Text(
                    "Logout",
                    style: titleStyle,
                  ),
                  onTap: () {},
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
