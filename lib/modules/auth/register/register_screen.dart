import 'package:arcopen_employee/modules/auth/register/register_controller.dart';
import 'package:arcopen_employee/utils/helpers/badge_input_formatter.dart';
import 'package:arcopen_employee/utils/helpers/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Okito.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () {
                        KRouter().pop();
                      },
                      icon: Icon(PhosphorIcons.arrow_left_bold),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Sign Up",
                      style: Okito.theme.textTheme.headline2,
                    ),
                    const SizedBox(height: 30),
                    KTextField.soft(
                        label: "NAME",
                        controller: controller.nameController,
                        validator: (String? value) {
                          return controller.validateRequired(fieldName: "name", value: value);
                        }),
                    const SizedBox(height: 20),
                    KTextField.soft(
                      label: "EMAIL",
                      keybordType: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                    const SizedBox(height: 20),
                    KTextField.soft(
                      label: "BADGE NUMBER",
                      hintText: "xxxx-xxxx-xxxx-xxxx",
                      controller: controller.badgeNumberController,
                      inputFormatters: [
                        BadgeInputFormatter(
                          mask: 'xxxx-xxxx-xxxx-xxxx',
                          separator: '-',
                        ),
                      ],
                      validator: (String? value) {
                        return controller.validateBadgeNumber(fieldName: "badge number", badgeNumber: value!);
                      },
                    ),
                    const SizedBox(height: 20),
                    KTextField.soft(
                      label: "EXPIRY DATE",
                      readOnly: true,
                      controller: controller.expireDateController,
                      validator: (String? value) {
                        return controller.validateDate(fieldName: "expiry date", value: value!);
                      },
                      onTap: () async {
                        final _date = await FormHelper.pickDate(context: context);
                        if (_date != null) {
                          controller.expireDateController.text = _date.toString().split(" ").first;
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    KTextField.soft(
                      label: "PASSWORD",
                      isPassword: true,
                      controller: controller.passwordController,
                      validator: (String? value) {
                        return controller.validateMinlength(fieldName: "password", value: value!, min: 8);
                      },
                    ),
                    const SizedBox(height: 20),
                    KTextField.soft(
                      label: "CONFIRM PASSWORD",
                      isPassword: true,
                      controller: controller.passConfirmController,
                      validator: (String? value) {
                        if (controller.passConfirmController.text != controller.passwordController.text) {
                          return "The passwords does not match";
                        }
                        return null;
                      },
                    ),
                    Okito.isLandscape ? SizedBox(height: 50) : AspectRatio(aspectRatio: 10 / 1),
                    KButton.outlined(
                      expanded: true,
                      onPressed: () {
                        controller.register();
                      },
                      title: "CREATE ACCOUNT",
                      color: Okito.theme.primaryColor,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
