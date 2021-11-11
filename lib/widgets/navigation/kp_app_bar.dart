import 'package:arcopen_employee/modules/auth/profile/profile_controller.dart';
import 'package:arcopen_employee/utils/helpers/asset_helper.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class KPAppBar extends StatelessWidget with PreferredSizeWidget {
  const KPAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    ImageProvider profilePicture = AssetImage(AssetHelper().getAsset(name: "avatar.png", assetType: AssetType.image));

    final authService = Okito.use<AuthService>();
    final user = authService.user;
    if (authService.profileExists && authService.profile!.profilePic.isNotEmpty) {
      profilePicture = NetworkImage(AssetHelper().getMemberProfilePic(name: authService.profile!.profilePic));
    }
    final List<_MenuItem> menuItems = [
      _MenuItem(
        onTap: () {
          controller.createOrUpdateProfile();
        },
        title: "Save changes",
      ),
      _MenuItem(
        onTap: () {
          Okito.use<AuthService>().logout();
        },
        title: "Logout",
      ),
    ];
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Okito.theme.primaryColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Okito.pop();
                },
                icon: Icon(PhosphorIcons.caret_left_bold),
                color: Colors.white,
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: ProfileController().pickPictureFile,
                child: CircleAvatar(
                  backgroundImage: profilePicture,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: ProfileController().profilePicFile == null
                        ? Image.asset(
                            "assets/images/avatar.png",
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          )
                        : Image.file(
                            ProfileController().profilePicFile!,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<int>(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      child: Text(menuItems[index].title),
                    );
                  });
                },
              ),
            ],
          ),
        ],
      ),
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
