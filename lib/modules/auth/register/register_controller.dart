import 'dart:io';

import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/http/requests/register_request.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:device_info/device_info.dart';
import 'package:okito/okito.dart';
import 'package:flutter/material.dart';

class RegisterController extends OkitoController with ValidationMixin, ToastMixin {
  RegisterController._internal();
  static final RegisterController _singleton = RegisterController._internal();

  factory RegisterController() {
    return _singleton;
  }

  final AuthRepository _repository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passConfirmController = TextEditingController();
  final TextEditingController badgeNumberController = TextEditingController();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      late String deviceType;
      late String deviceId;

      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceType = "android";
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceType = "ios";
        deviceId = iosInfo.identifierForVendor;
      } else {
        deviceType = "unknown";
        deviceId = "unknown";
      }

      KLoader().show();
      _repository.register(
        request: RegisterRequest(
          badgeNumber: badgeNumberController.text,
          deviceId: deviceId,
          deviceType: deviceType,
          email: emailController.text,
          expiryDate: DateTime.parse(expireDateController.text),
          name: nameController.text,
          password: passwordController.text,
        ),
      ).then((value) {
        this.showSuccessToast(value.success);
        KLoader.hide();
        KRouter().pop();
      }).catchError((e) {
        KLoader.hide();
        this.showErrorToast(e.message);
      });
    }
  }
}
