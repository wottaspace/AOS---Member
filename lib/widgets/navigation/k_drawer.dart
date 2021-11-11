import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/utils/helpers/asset_helper.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Okito.theme.textTheme.bodyText2!.copyWith(fontSize: 16.0);
    ImageProvider profilePicture = AssetImage(AssetHelper().getAsset(name: "avatar.png", assetType: AssetType.image));

    final authService = Okito.use<AuthService>();
    if (authService.profileExists && authService.profile!.profilePic.isNotEmpty) {
      profilePicture = NetworkImage(AssetHelper().getMemberProfilePic(name: authService.profile!.profilePic));
    }
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
                        Okito.pop();
                      },
                      icon: const Icon(PhosphorIcons.x_bold, size: 25),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Okito.pushNamed(KRoutes.profileRoute);
                      },
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundImage: profilePicture,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListTile(
                  dense: true,
                  onTap: () {
                    Okito.pushNamed(KRoutes.choosePlanRoute);
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
                const Divider(),
                ListTile(
                  dense: true,
                  onTap: () {
                    Okito.pushNamed(KRoutes.settingsRoute);
                  },
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
                  onTap: () {
                    Okito.pushNamed(KRoutes.disputesRoute);
                  },
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
                  onTap: () async {
                    if (await canLaunch(AppConstants.supportUrl)) {
                      launch(AppConstants.supportUrl);
                    }
                  },
                ),
                const Divider(),
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
                  onTap: () {
                    Okito.pushNamed(KRoutes.inviteFriendsRoute);
                  },
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
                  onTap: () {
                    Okito.use<AuthService>().logout();
                  },
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
