import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/http/requests/job_apply_request.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:okito/okito.dart';

class JobDetailsController extends OkitoController with ToastMixin {
  JobDetailsController._internal();
  static final JobDetailsController _singleton = JobDetailsController._internal();

  factory JobDetailsController() {
    return _singleton;
  }

  Job? job;

  final JobsRepository repository = JobsRepository();

  void init() {
    job = Okito.arguments["job"];
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {});
    });
  }

  // Job application management
  final GlobalKey<FormState> applyFormKey = GlobalKey<FormState>();
  final TextEditingController payRateController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future applyForJob() async {
    if (applyFormKey.currentState!.validate()) {
      final JobApplyRequest request = JobApplyRequest(
        payExpected: payRateController.text.isEmpty ? job!.budget.split(" ").first : payRateController.text,
        message: messageController.text,
        jobId: job!.id.toString(),
        memberStatus: "Accept",
      );

      KLoader().show();
      repository.applyForJob(request: request).then((value) {
        KLoader.hide();
        KRouter().push(KRoutes.applySuccessRoute);
      }).catchError((e) {
        this.showErrorToast(e.toString());
        KLoader.hide();
      });
    }
  }

  Future declineJob() async {
    final JobApplyRequest request = JobApplyRequest(
      payExpected: payRateController.text.isEmpty ? job!.budget.split(" ").first : payRateController.text,
      message: messageController.text,
      jobId: job!.id.toString(),
      memberStatus: "Decline",
    );

    KLoader().show();
    repository.applyForJob(request: request).then((value) {
      KLoader.hide();
      KRouter().push(KRoutes.applySuccessRoute);
    }).catchError((e) {
      this.showErrorToast(e.toString());
      KLoader.hide();
    });
  }
}
