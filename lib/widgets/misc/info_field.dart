import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';

class InfoField extends StatelessWidget {
  const InfoField({
    Key? key,
    this.leading,
    required this.title,
    required this.contentTitle,
    this.contentSubtitle,
  }) : super(key: key);

  final Widget? leading;
  final String title;
  final String contentTitle;
  final String? contentSubtitle;

  @override
  Widget build(BuildContext context) {
    final Widget titleWidget = Text(
      "$contentTitle",
      style: Okito.theme.textTheme.bodyText2,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width,
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                if (leading != null) leading!,
                SizedBox(width: 10),
                if (contentSubtitle == null)
                  Expanded(child: titleWidget)
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleWidget,
                      Text(
                        "$contentSubtitle",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 12.0,
                          color: ColorConstants.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
