import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class InviteController extends OkitoController with ToastMixin {
  final JobsRepository jobsRepository = JobsRepository();
  final TextEditingController emailController = TextEditingController();

  void sendInvite() {
    if (emailController.text.isEmpty) {
      this.showErrorToast("The email field cannot be empty.");
      return;
    }

    KLoader().show();
    jobsRepository.inviteFriend(email: emailController.text).then((value) {
      emailController.clear();
      setState(() {});
      this.showSuccessToast(value);
      KLoader.hide();
    }).catchError((e) {
      KLoader.hide();
      this.showErrorToast(e.message);
    });
  }
}
