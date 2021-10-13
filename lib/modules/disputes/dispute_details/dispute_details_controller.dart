import 'package:arcopen_employee/core/models/complaint.dart';
import 'package:arcopen_employee/core/models/job_details.dart';
import 'package:arcopen_employee/utils/mixins/logging_mixin.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:okito/okito.dart';

class DisputeDetailsController extends OkitoController with ToastMixin, LoggingMixin {
  static final DisputeDetailsController shared = DisputeDetailsController();
  final JobsRepository repository = JobsRepository();

  JobDetails? jobDetails;

  void loadJobDetails() async {
    try {
      final Complaint dispute = Okito.arguments["dispute"];
      final jobId = dispute.jobId;
      jobDetails = (await repository.getJobDetails(jobId: jobId.toString())).jobDetails;
      setState(() { });
    } on Exception catch (e) {
      logger.wtf(e);
      this.showErrorToast("Failed to load data. Please check your internet connection and try again later.");
    }
  }
}
