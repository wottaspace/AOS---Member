import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';
import 'package:openarc_employee/widgets/navigation/k_app_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Change Password",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Change Password",
                      style: Okito.theme.textTheme.headline2!.copyWith(fontSize: 14.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        KTextField.exposed(controller: _oldPasswordController, hintText: "Old password"),
                        SizedBox(height: 20),
                        KTextField.exposed(controller: _newPasswordController, hintText: "New password"),
                        SizedBox(height: 20),
                        KTextField.exposed(controller: _confirmPasswordController, hintText: "Confirm new password"),
                        SizedBox(height: 20),
                        KButton(
                          expanded: true,
                          onPressed: () {},
                          title: "CHANGE PASSWORD",
                          color: Okito.theme.primaryColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
