import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/http/responses/timesheet_job_response.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:okito/okito.dart';

class JobTimesheetsController extends OkitoController with ToastMixin {
  JobTimesheetsController._internal();
  static final JobTimesheetsController _singleton = JobTimesheetsController._internal();

  factory JobTimesheetsController() {
    return _singleton;
  }

  final JobsRepository jobsRepository = JobsRepository();
  LoadingState loadingState = LoadingState.loading;
  List<Job> activeJobs = [];
  List<UpcomingJob> upcomingJobs = [];

  void loadJobs() {
    setState(() {
      loadingState = LoadingState.success;
    });
    jobsRepository.getTimesheetJobs().then((value) {
      setState(() {
        loadingState = LoadingState.success;
        upcomingJobs = value.upcomingJobs;
        activeJobs = value.activeJob;
      });
    }).catchError((e) {
      setState(() {
        loadingState = LoadingState.failed;
      });
      this.showErrorToast("Failed to load jobs. Please try again later.");
    });
  }
}
