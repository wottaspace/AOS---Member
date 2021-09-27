import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:okito/okito.dart';

class JobHistoryController extends OkitoController with ToastMixin {
  JobHistoryController._internal();
  static final JobHistoryController _singleton = JobHistoryController._internal();

  factory JobHistoryController() {
    return _singleton;
  }

  List<Job> jobs = [];
  LoadingState loadingState = LoadingState.loading;

  final JobsRepository repository = JobsRepository();

  void loadJobs() {
    setState(() {
      loadingState = LoadingState.loading;
    });
    repository.getPastJobs().then((value) {
      setState(() {
        loadingState = LoadingState.success;
        jobs = value.pastJobs;
      });
    }).catchError((e) {
      setState(() {
        loadingState = LoadingState.failed;
      });
      this.showErrorToast("Failed to load jobs. Please try again later.");
    });
  }
}
