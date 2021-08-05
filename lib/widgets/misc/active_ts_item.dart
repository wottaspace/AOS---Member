import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';

class ActiveTSItem extends StatelessWidget {
  const ActiveTSItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.lightBlue,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Text(
          "$title",
          style: Okito.theme.textTheme.bodyText2!.copyWith(fontSize: 10.0),
        ),
      ),
    );
  }
}
