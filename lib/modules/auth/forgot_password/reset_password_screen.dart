import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Okito.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset("assets/images/keys.png"),
                ),
                SizedBox(height: 20),
                Text(
                  "Enter your email and we'll send you instructions to set new password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                KTextField(
                  controller: _emailController,
                  hintText: "email",
                  icon: PhosphorIcons.envelope_fill,
                ),
                SizedBox(height: 20),
                KButton(
                  onPressed: () {
                    // TODO: implement reset password
                    KRouter().push(KRoutes.resetPasswordSuccessRoute);
                  },
                  title: "RESET PASSWORD",
                  color: ColorConstants.greenColor,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
