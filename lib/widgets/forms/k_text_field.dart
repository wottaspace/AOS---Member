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
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: ColorConstants.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: BorderSide(color: Okito.theme.primaryColor),
        ),
      ),
    );
  }

  static Widget soft({
    required String label,
    required TextEditingController controller,
    String? hintText,
    bool isPassword = false,
    IconData? suffixIcon,
    Icon? prefixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label",
          style: Okito.theme.textTheme.bodyText2!.copyWith(
            color: ColorConstants.greyColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4.0,
                offset: Offset(1, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Okito.theme.textTheme.bodyText2!.copyWith(
                fontSize: 14.0,
                color: ColorConstants.greyColor,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon == null
                  ? null
                  : Icon(
                      suffixIcon,
                      color: Okito.theme.primaryColor,
                    ),
              contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget circular({
    IconData? leading,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: ColorConstants.greyColor.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Okito.theme.primaryColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: ColorConstants.greyColor.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          hintText: hintText,
          hintStyle: Okito.theme.textTheme.bodyText2!.copyWith(
            color: ColorConstants.greyColor,
            fontSize: 14.0,
          ),
          prefixIcon: (leading != null) ? Icon(leading) : null,
        ),
      ),
    );
  }
}
