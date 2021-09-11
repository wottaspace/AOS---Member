import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class PasswordController extends OkitoController with ToastMixin {
  PasswordController._internal();
  static final PasswordController _singleton = PasswordController._internal();

  factory PasswordController() {
    return _singleton;
  }

  final AuthRepository _repository = AuthRepository();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController resetPasswordEmailController = TextEditingController();

  sendResetPasswordRequest() {
    if (resetPasswordFormKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        "email": resetPasswordEmailController.text,
      };
      KLoader().show();
      _repository.sendForgotPasswordRequest(data).then((value) {
        KLoader.hide();
        Okito.pushNamed(KRoutes.resetPasswordSuccessRoute, arguments: data);
      }).catchError((e) {
        KLoader.hide();
        this.showErrorToast(e.message);
      });
    }
  }
}
