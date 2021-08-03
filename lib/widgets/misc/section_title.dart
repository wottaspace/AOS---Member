import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: Okito.theme.textTheme.bodyText2!.copyWith(
        fontSize: 10.0,
        letterSpacing: 1.3,
        fontWeight: FontWeight.w600,
        color: ColorConstants.greyColor,
      ),
    );
  }
}
