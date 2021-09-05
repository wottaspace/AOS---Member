import 'package:arcopen_employee/http/responses/login_response.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:okito/okito.dart';
import 'package:flutter/material.dart';

class ProfileController extends OkitoController {
  ProfileController._internal();
  static final ProfileController _singleton = ProfileController._internal();

  factory ProfileController() {
    return _singleton;
  }

  final TextEditingController driveController = TextEditingController();
  final TextEditingController badgeNumberController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController hourlyRateController = TextEditingController();
  final TextEditingController unavailabilityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  prefillForm() {
    final User user = Okito.use<AuthService>().user;
    badgeNumberController.text = user.badgeNumber!;
    setState(() {});
    // TODO: fill profile info
  }

  void createOrUpdateProfile() {
    if (Okito.use<AuthService>().profileExists)
      _updateProfile();
    else
      _createProfile();
  }

  _createProfile() {}

  _updateProfile() {}
}
