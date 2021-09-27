import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:okito/okito.dart';

class JobInvitesController extends OkitoController with ToastMixin {
  JobInvitesController._internal();
  static final JobInvitesController _singleton = JobInvitesController._internal();

  factory JobInvitesController() {
    return _singleton;
  }

  final JobsRepository jobsRepository = JobsRepository();
  LoadingState loadingState = LoadingState.loading;
  List<Job> jobs = [];

  void loadJobs() {
    setState(() {
      loadingState = LoadingState.success;
    });
    jobsRepository.getInvites().then((value) {
      setState(() {
        loadingState = LoadingState.success;
        jobs = value.jobs;
      });
    }).catchError((e) {
      setState(() {
        loadingState = LoadingState.failed;
      });
      this.showErrorToast("Failed to load jobs. Please try again later.");
    });
  }
}
