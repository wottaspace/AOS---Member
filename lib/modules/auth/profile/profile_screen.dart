import 'package:arcopen_employee/modules/auth/profile/profile_controller.dart';
import 'package:arcopen_employee/utils/helpers/badge_input_formatter.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ValidationMixin {
  final ProfileController profileController = ProfileController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      profileController.prefillForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Okito.theme.textTheme.bodyText2!.copyWith(
      fontSize: 10.0,
      letterSpacing: 1.3,
      fontWeight: FontWeight.w600,
      color: ColorConstants.greyColor,
    );

    final List<_MenuItem> menuItems = [
      _MenuItem(
        onTap: () {
          profileController.createOrUpdateProfile();
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

    final user = Okito.use<AuthService>().user;

    ImageProvider profilePicture = AssetImage("assets/images/avatar.png");
    if (profileController.profilePicFile != null) {
      profilePicture = FileImage(profileController.profilePicFile!);
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        body: SingleChildScrollView(
          child: OkitoBuilder(
            activateLifecycleForOtherControllers: true,
            controller: profileController,
            builder: () {
              return Form(
                key: profileController.formKey,
                child: Column(
                  children: [
                    Container(
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
                                onTap: profileController.pickPictureFile,
                                child: CircleAvatar(
                                  backgroundImage: profilePicture,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60.0),
                                    child: profileController.profilePicFile == null
                                        ? Image.asset(
                                            "assets/images/avatar.png",
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          )
                                        : Image.file(
                                            profileController.profilePicFile!,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          KTextField.soft(
                            label: "ABOUT",
                            controller: profileController.aboutController,
                            minLines: 3,
                            maxLines: 4,
                            hintText: "Lorem ipsum dolor sit atmet, consectur adipiscing elit, sed do eiusmod tempor incicident ut labore et dolore magna aliqua",
                          ),
                          SizedBox(height: 10),
                          SectionTitle(title: "RESUME/CV"),
                          SizedBox(height: 10),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/portfolio.png"),
                                  SizedBox(height: 10),
                                  Text(
                                    profileController.getResumeFilename ?? "Add resume",
                                    style: titleStyle.copyWith(fontSize: 12.0),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Add summary to make your profile look good. Add summary to make your profile look good. Add summary to make your profile look good.",
                                    textAlign: TextAlign.center,
                                    style: titleStyle.copyWith(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  KButton.outlined(
                                    expanded: true,
                                    onPressed: () {
                                      profileController.pickResumeFile();
                                    },
                                    title: "ADD RESUME",
                                    color: Okito.theme.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: KTextField.soft(
                                  label: "DO YOU DRIVE ?",
                                  controller: profileController.driveController,
                                  hintText: "Type Yes or No",
                                  validator: (String? value) {
                                    return this.validateValueEquals(fieldName: "Drive option", value: value!, equalValues: ["yes", "no"]);
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: KTextField.soft(
                                  label: "BADGE NUMBER",
                                  controller: profileController.badgeNumberController,
                                  inputFormatters: [
                                    BadgeInputFormatter(
                                      mask: 'xxxx-xxxx-xxxx-xxxx',
                                      separator: '-',
                                    ),
                                  ],
                                  validator: (String? value) {
                                    return this.validateRequired(fieldName: "badge number", value: value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: KTextField.soft(
                                  label: "CONTACT*",
                                  prefixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: profileController.pickPhoneCode,
                                    icon: FittedBox(
                                      child: Text("${profileController.contactDialCode}"),
                                    ),
                                  ),
                                  keybordType: TextInputType.number,
                                  controller: profileController.contactController,
                                  validator: (String? value) {
                                    return this.validateRequired(fieldName: "contact", value: value);
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: KTextField.soft(
                                  label: "HOURLY RATE",
                                  keybordType: TextInputType.number,
                                  controller: profileController.hourlyRateController,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          KTextField.soft(
                            label: "UNAVAILABILITY",
                            suffixIcon: PhosphorIcons.calendar,
                            readOnly: true,
                            onTap: profileController.selectUnavailabilityRange,
                            controller: profileController.unavailabilityController,
                          ),
                          SizedBox(height: 20),
                          KTextField.soft(
                            label: "ADRESS",
                            controller: profileController.addressController,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: KTextField.soft(
                                  label: "CITY",
                                  controller: profileController.cityController,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: KTextField.soft(
                                  label: "POSTAL CODE",
                                  controller: profileController.postalCodeController,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Okito.theme.primaryColor,
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final VoidCallback onTap;

  _MenuItem({
    required this.onTap,
    required this.title,
  });
}
