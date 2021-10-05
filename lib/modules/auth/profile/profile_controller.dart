import 'dart:io';

import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/core/models/user.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:okito/okito.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:phone_code_picker/phone_code_picker.dart';

class ProfileController extends OkitoController with ToastMixin {
  ProfileController._internal();
  static final ProfileController _singleton = ProfileController._internal();

  factory ProfileController() {
    return _singleton;
  }
  
  final AuthRepository repository = AuthRepository();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? resumeFile;
  File? profilePicFile;
  String contactDialCode = "+1";
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController driveController = TextEditingController();
  final TextEditingController badgeNumberController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController hourlyRateController = TextEditingController();
  final TextEditingController unavailabilityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  String? get getResumeFilename => resumeFile == null ? null : basename(resumeFile!.path);

  void prefillForm() {
    final AuthService service = Okito.use<AuthService>();
    final User user = service.user;
    badgeNumberController.text = user.badgeNumber!;
    if (service.profileExists) {
      aboutController.text = service.profile.about;
      driveController.text = service.profile.drive ? "YES" : "NO";
      badgeNumberController.text = service.profile.badgeNumber;

      List<String> parts = service.profile.contact.split("-");
      contactDialCode = parts.first;

      contactController.text = parts.skip(1).join("-");
      hourlyRateController.text = service.profile.hourlyRate;
      unavailabilityController.text = service.profile.unavailabilityDates.join(" - ");
      addressController.text = service.profile.address;
      cityController.text = service.profile.city;
      postalCodeController.text = service.profile.postalCode;
    }
    setState(() {});
  }

  pickResumeFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["pdf", "docx", "doc"],
      type: FileType.custom,
    );
    if (result != null) {
      resumeFile = File(result.files.single.path);
      setState(() {});
    }
  }

  void selectUnavailabilityRange() async {
    final now = DateTime.now();
    final fieldValue = unavailabilityController.text;
    final DateTimeRange? range = await showDateRangePicker(
      context: Okito.context!,
      initialDateRange: fieldValue.isEmpty
          ? null
          : DateTimeRange(
              start: DateTime.parse(fieldValue.split(" - ").first),
              end: DateTime.parse(fieldValue.split(" - ").last),
            ),
      firstDate: DateTime(now.year),
      lastDate: DateTime(now.year + 5),
    );

    if (range != null) {
      final firstDate = range.start.toString().split(" ").first;
      final lastDate = range.end.toString().split(" ").first;
      unavailabilityController.text = "$firstDate - $lastDate";
      setState(() {});
    }
  }

  Future<void> pickPictureFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      profilePicFile = File(result.files.single.path);
      setState(() {});
    }
  }

  void pickPhoneCode() {
    showModalBottomSheet(
      context: Okito.context!,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      builder: (_) => Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(Okito.context!).viewPadding.bottom),
        child: PhoneCodePicker(
          primaryColor: Okito.theme.primaryColor,
          onSelected: (country) {
            contactDialCode = country.dialCode;
            setState(() {});
          },
        ),
      ),
    );
  }

  void createOrUpdateProfile() {
    if (formKey.currentState!.validate()) {
      if (Okito.use<AuthService>().profileExists)
        _updateProfile();
      else
        _createProfile();
    }
  }

  FormData computeFormData() {
    return FormData.fromMap({
      "about": aboutController.text,
      "drive": driveController.text,
      "contact": "$contactDialCode-${contactController.text}",
      "address": addressController.text,
      "city": cityController.text,
      "postal_code": postalCodeController.text,
      "hourly_rate": hourlyRateController.text,
      "unavailable_dates": unavailabilityController.text.split(" - "),
      if (resumeFile != null) "cv": MultipartFile.fromFile(resumeFile!.path),
      if (profilePicFile != null) "profile_pic": MultipartFile.fromFile(profilePicFile!.path),
    });
  }

  _createProfile() {
    KLoader().show();
    repository.createProfile(data: computeFormData()).then((value) {
      KLoader.hide();
      Okito.use<AuthService>().profileExists = true;
      Okito.use<AuthService>().profile = value.profile;
      Okito.pushNamed(KRoutes.exploreRoute);
    }).catchError((e) {
      this.showErrorToast(e.message);
      KLoader.hide();
    });
  }

  _updateProfile() {
    KLoader().show();
    repository.updateProfile(data: computeFormData()).then((value) {
      KLoader.hide();
      Okito.use<AuthService>().profile = value.profile;
      this.showSuccessToast("Your changes has been saved successfully.");
    }).catchError((e) {
      this.showErrorToast(e.message);
      KLoader.hide();
    });
  }
}
