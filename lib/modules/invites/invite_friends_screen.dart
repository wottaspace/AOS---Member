import 'package:arcopen_employee/modules/invites/invite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  @override
  _InviteFriendsScreenState createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  final InviteController controller = InviteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Invite friends",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(aspectRatio: 10 / 2),
                Image.asset("assets/images/1028.png"),
                const SizedBox(height: 10),
                Text(
                  "Invite Your Friends",
                  style: Okito.theme.textTheme.headline2!.copyWith(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Invite your friends to join the app.",
                    textAlign: TextAlign.center,
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      color: ColorConstants.greyColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OkitoBuilder(
                  controller: controller,
                  activateLifecycleForOtherControllers: true,
                  builder: () {
                    return KTextField(
                      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      controller: controller.emailController,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      icon: PhosphorIcons.envelope_fill,
                      color: ColorConstants.lightBlue.withOpacity(0.8),
                    );
                  },
                ),
                const SizedBox(height: 20),
                KButton(
                  onPressed: controller.sendInvite,
                  title: "SEND INVITE",
                  color: Okito.theme.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
