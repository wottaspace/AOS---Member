import 'package:arcopen_employee/modules/auth/login/login_controller.dart';
import 'package:arcopen_employee/widgets/misc/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return DoubleTapToExit(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: OkitoBuilder(
          controller: controller,
          builder: () {
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Okito.isLandscape ? AspectRatio(aspectRatio: 15 / 1) : AspectRatio(aspectRatio: 10 / 4),
                          Container(
                            width: 200,
                            height: 80,
                            child: Image.asset("assets/images/logo.png"),
                          ),
                          Text("Log In and get things done"),
                          const SizedBox(height: 50),
                          KTextField(
                            controller: controller.emailController,
                            hintText: "email",
                            keyboardType: TextInputType.emailAddress,
                            icon: PhosphorIcons.envelope,
                            validator: (String? value) {
                              return controller.validateRequired(fieldName: "email", value: value);
                            },
                          ),
                          const SizedBox(height: 20),
                          KTextField(
                            controller: controller.passwordController,
                            hintText: "password",
                            isPassword: true,
                            icon: PhosphorIcons.key_fill,
                            validator: (String? value) {
                              return controller.validateRequired(fieldName: "password", value: value);
                            },
                          ),
                          const SizedBox(height: 20),
                          KButton(
                            onPressed: () {
                              controller.login();
                            },
                            title: "LOG IN",
                            color: ColorConstants.greenColor,
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              KRouter().push(KRoutes.resetPasswordRoute);
                            },
                            child: Text(
                              "Forgot password ?",
                              style: Okito.theme.textTheme.bodyText2!.copyWith(
                                color: ColorConstants.greyColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "- OR -",
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              color: ColorConstants.greyColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          KButton.outlined(
                            expanded: true,
                            onPressed: () {
                              KRouter().push(KRoutes.registerRoute);
                            },
                            title: "+ CREATE ACCOUNT",
                            color: Okito.theme.primaryColor,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
