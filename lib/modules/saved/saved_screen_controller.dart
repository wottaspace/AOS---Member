import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:okito/okito.dart';

class SavedScreenController extends OkitoController with ToastMixin {
  SavedScreenController._internal();
  static final SavedScreenController _singleton = SavedScreenController._internal();

  factory SavedScreenController() {
    return _singleton;
  }

  final JobsRepository repository = JobsRepository();

  List<Job> jobs = [];
  LoadingState jobLoadingState = LoadingState.loading;
  Future<void> getSavedJobs() async {
    setState(() {
      jobLoadingState = LoadingState.loading;
    });
    repository.getSavedJobs().then((value) {
      setState(() {
        jobLoadingState = LoadingState.success;
        jobs = value.jobs;
      });
    }).catchError((e) {
      print(e);
      setState(() {
        jobLoadingState = LoadingState.failed;
      });
      this.showErrorToast("Sorry we were not able to load your data. Please try again later.");
    });
  }
}
