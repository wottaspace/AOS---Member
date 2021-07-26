import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Okito.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Icon(PhosphorIcons.arrow_left_bold),
                  SizedBox(height: 40),
                  Text(
                    "Sign Up",
                    style: Okito.theme.textTheme.headline2,
                  ),
                  SizedBox(height: 30),
                  KTextField.soft(
                    label: "NAME",
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "EMAIL",
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(label: "BADGE NUMBER", hintText: "xxxx-xxxx-xxxx-xxxx"),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "EXPIRY DATE",
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "PASSWORD",
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "CONFIRM PASSWORD",
                    isPassword: true,
                  ),
                  Spacer(flex: 2),
                  KButton.outlined(
                    expanded: true,
                    onPressed: () {
                      // TODO: implement account creation
                      KRouter().push(KRoutes.exploreRoute);
                    },
                    title: "CREATE ACCOUNT",
                    color: Okito.theme.primaryColor,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
