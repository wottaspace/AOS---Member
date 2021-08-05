import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _expireDateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();
  final TextEditingController _badgeNumberController = TextEditingController();
  
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  IconButton(
                    onPressed: () {
                      KRouter().pop();
                    },
                    icon: Icon(PhosphorIcons.arrow_left_bold),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Sign Up",
                    style: Okito.theme.textTheme.headline2,
                  ),
                  SizedBox(height: 30),
                  KTextField.soft(
                    label: "NAME",
                    controller: _nameController,
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "EMAIL",
                    controller: _emailController,
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "BADGE NUMBER",
                    hintText: "xxxx-xxxx-xxxx-xxxx",
                    controller: _badgeNumberController,
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "EXPIRY DATE",
                    controller: _expireDateController,
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "PASSWORD",
                    isPassword: true,
                    controller: _passwordController,
                  ),
                  SizedBox(height: 20),
                  KTextField.soft(
                    label: "CONFIRM PASSWORD",
                    isPassword: true,
                    controller: _passConfirmController,
                  ),
                  Okito.isLandscape ? SizedBox(height: 50) : AspectRatio(aspectRatio: 5 / 1),
                  KButton.outlined(
                    expanded: true,
                    onPressed: () {
                      // TODO: implement account creation
                      KRouter().push(KRoutes.exploreRoute);
                    },
                    title: "CREATE ACCOUNT",
                    color: Okito.theme.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
