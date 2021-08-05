import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';

class KPAppBar extends StatelessWidget with PreferredSizeWidget {
  const KPAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_MenuItem> menuItems = [
      _MenuItem(
        title: "Edit Profile",
        onTap: () {
          print("Fuck you wallah");
        },
      ),
      _MenuItem(
        title: "Logout",
        onTap: () {},
      ),
    ];
    return AppBar(
      leading: IconButton(
        icon: Icon(
          PhosphorIcons.caret_left_bold,
          color: Colors.white,
        ),
        onPressed: KRouter().pop,
      ),
      title: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        leading: CircleAvatar(),
        title: Text(
          "Harry Sahir",
          style: Okito.theme.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          "Cambridge: ON",
          style: Okito.theme.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
      actions: [
        PopupMenuButton<int>(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              PhosphorIcons.dots_three_vertical_bold,
              color: Colors.white,
            ),
          ),
          onSelected: (int index) {
            menuItems[index].onTap();
          },
          itemBuilder: (context) {
            return List.generate(menuItems.length, (index) {
              return PopupMenuItem(
                value: index,
                child: Text("${menuItems[index].title}"),
              );
            });
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65.0);
}

class _MenuItem {
  final String title;
  final VoidCallback onTap;

  _MenuItem({
    required this.title,
    required this.onTap,
  });
}
