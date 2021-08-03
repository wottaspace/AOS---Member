import 'package:flutter/material.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/forms/k_text_field.dart';
import 'package:openarc_employee/widgets/navigation/k_app_bar.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _softCodeController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Bank Details",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                KTextField.soft(label: "FIRST NAME", controller: _firstNameController),
                SizedBox(height: 20),
                KTextField.soft(label: "LAST NAME", controller: _lastNameController),
                SizedBox(height: 20),
                KTextField.soft(label: "ACCOUNT NUMBER", controller: _accountNumberController),
                SizedBox(height: 20),
                KTextField.soft(label: "SOFT CODE", controller: _softCodeController),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: KTextField.soft(label: "DOB", controller: _dobController),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: KTextField.soft(label: "PHONE NUMBER", controller: _phoneNumberController),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                KTextField.soft(label: "ADDRESS", controller: _addressController),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: KTextField.soft(label: "CITY", controller: _cityController),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: KTextField.soft(label: "POSTAL CODE", controller: _postalCodeController),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: KButton(
          color: ColorConstants.greenColor,
          onPressed: () {},
          title: "SAVE",
        ),
      ),
    );
  }
}
