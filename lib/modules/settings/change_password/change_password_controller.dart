import 'package:arcopen_employee/http/requests/change_password_request.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:okito/okito.dart';
import 'package:flutter/material.dart';

class ChangePasswordController extends OkitoController with ToastMixin, ValidationMixin {
  ChangePasswordController._internal();
  static final ChangePasswordController _singleton = ChangePasswordController._internal();

  factory ChangePasswordController() {
    return _singleton;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepository repository = AuthRepository();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void changePassword() {
    if (formKey.currentState!.validate()) {
      final request = ChangePasswordRequest(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      KLoader().show();
      repository.changePassword(request: request).then((value) {
        this.showSuccessToast(value);

        oldPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
        setState(() {});

        KLoader.hide();
      }).catchError((e) {
        this.showErrorToast(e.message);
        KLoader.hide();
      });
    }
  }
}
