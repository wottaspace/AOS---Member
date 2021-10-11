import 'package:arcopen_employee/modules/auth/forgot_password/password_controller.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with ValidationMixin {
  final PasswordController passwordController = PasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Okito.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: passwordController.resetPasswordFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset("assets/images/keys.png"),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Enter your email and we'll send you instructions to set new password",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  KTextField(
                    controller: passwordController.resetPasswordEmailController,
                    hintText: "email",
                    icon: PhosphorIcons.envelope_fill,
                    validator: (String? email) {
                      return this.validateEmail(fieldName: "email", email: email!);
                    },
                  ),
                  const SizedBox(height: 20),
                  KButton(
                    onPressed: passwordController.sendResetPasswordRequest,
                    title: "RESET PASSWORD",
                    color: ColorConstants.greenColor,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
