import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';

class KChip extends StatelessWidget {
  const KChip({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconAlignedLeading = true,
    this.circularCorners = false,
  }) : super(key: key);

  final bool iconAlignedLeading;
  final bool circularCorners;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: circularCorners ? BorderRadius.circular(60.0) : BorderRadius.circular(4.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2.0,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconAlignedLeading) ...[
                  Icon(
                    icon,
                    size: 14,
                    color: ColorConstants.greyColor,
                  ),
                  SizedBox(width: 5),
                ],
                Text(
                  "$title",
                  style: Okito.theme.textTheme.bodyText2!.copyWith(
                    fontSize: 12.0,
                    color: ColorConstants.greyColor,
                  ),
                ),
                if (!iconAlignedLeading) ...[
                  SizedBox(width: 5),
                  Icon(
                    icon,
                    size: 14,
                    color: ColorConstants.greyColor,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
