import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';

class KAppBar extends StatelessWidget with PreferredSizeWidget {
  const KAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          PhosphorIcons.caret_left_bold,
          color: Colors.black,
        ),
        onPressed: () {
          KRouter().pop();
        },
      ),
      title: Text(
        "$title",
        style: Okito.theme.textTheme.headline3,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
