import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: BorderSide(color: ColorConstants.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: BorderSide(color: Okito.theme.primaryColor),
        ),
      ),
    );
  }
}
