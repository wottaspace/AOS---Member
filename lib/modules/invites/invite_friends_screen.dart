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
  final TextEditingController _emailController = TextEditingController();

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
                SizedBox(height: 10),
                Text(
                  "Invite Your Friends",
                  style: Okito.theme.textTheme.headline2!.copyWith(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                    textAlign: TextAlign.center,
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      color: ColorConstants.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                KTextField(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  controller: _emailController,
                  hintText: "Email",
                  icon: PhosphorIcons.envelope_fill,
                  color: ColorConstants.lightBlue.withOpacity(0.8),
                ),
                SizedBox(height: 20),
                KButton(
                  onPressed: () {},
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
