import 'package:arcopen_employee/modules/auth/profile/profile_controller.dart';
import 'package:arcopen_employee/utils/helpers/badge_input_formatter.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:arcopen_employee/widgets/navigation/kp_app_bar.dart';
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
                    KPAppBar(
                      controller: profileController,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          KTextField.soft(
                            label: "ABOUT",
                            controller: profileController.aboutController,
                            minLines: 3,
                            maxLines: 4,
                            hintText: "Lorem ipsum dolor sit atmet, consectur adipiscing elit, sed do eiusmod tempor incicident ut labore et dolore magna aliqua",
                          ),
                          const SizedBox(height: 10),
                          SectionTitle(title: "RESUME/CV"),
                          const SizedBox(height: 10),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/portfolio.png"),
                                  const SizedBox(height: 10),
                                  Text(
                                    profileController.getResumeFilename ?? "Add resume",
                                    style: titleStyle.copyWith(fontSize: 12.0),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Add summary to make your profile look good. Add summary to make your profile look good. Add summary to make your profile look good.",
                                    textAlign: TextAlign.center,
                                    style: titleStyle.copyWith(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
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
                              const SizedBox(width: 20),
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
                          const SizedBox(height: 20),
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
                              const SizedBox(width: 20),
                              Expanded(
                                child: KTextField.soft(
                                  label: "HOURLY RATE",
                                  keybordType: TextInputType.number,
                                  controller: profileController.hourlyRateController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          KTextField.soft(
                            label: "UNAVAILABILITY",
                            suffixIcon: PhosphorIcons.calendar,
                            readOnly: true,
                            onTap: profileController.selectUnavailabilityRange,
                            controller: profileController.unavailabilityController,
                          ),
                          const SizedBox(height: 20),
                          KTextField.soft(
                            label: "ADRESS",
                            controller: profileController.addressController,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: KTextField.soft(
                                  label: "CITY",
                                  controller: profileController.cityController,
                                ),
                              ),
                             const  SizedBox(width: 20),
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
