import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/saved/saved_screen_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:okito/okito.dart';

class ExploreScreenController extends OkitoController with ToastMixin {
  ExploreScreenController._internal();
  static final ExploreScreenController _singleton = ExploreScreenController._internal();

  factory ExploreScreenController() {
    return _singleton;
  }

  final JobsRepository _repository = JobsRepository();
  final TextEditingController searchController = TextEditingController();

  List<Job> jobList = [];
  List<Job> recommendedJobs = [];

  // Job loading state
  LoadingState jobLoadingState = LoadingState.loading;

  Future<void> loadJobs() async {
    setState(() {
      jobLoadingState = LoadingState.loading;
    });
    _repository.browseJobs().then((value) {
      setState(() {
        jobLoadingState = LoadingState.success;
        jobList = value.jobs;
        recommendedJobs = value.recommendedJobs;
      });
    }).catchError((e) {
      setState(() {
        jobLoadingState = LoadingState.failed;
      });
      this.showErrorToast("Sorry, we are not able to load the data.");
    });
  }

  Future<void> saveJob({required int jobId}) async {
    KLoader().show();
    _repository.saveJob(jobId: jobId).then((value) {
      KLoader.hide();
      this.showSuccessToast("Job successfully saved.");
    }).catchError((e) {
      KLoader.hide();
      this.showErrorToast(e.message);
    });
  }

  Future<void> removeSavedJob({required int jobId}) async {
    KLoader().show();
    _repository.removeSavedJob(jobId: jobId).then((value) {
      KLoader.hide();
      SavedScreenController().jobs.removeWhere((element) => element.id == jobId);
      SavedScreenController().setState(() {});
      this.showSuccessToast("Job successfully removed from saved list.");
    }).catchError((e) {
      KLoader.hide();
      this.showErrorToast(e.message);
    });
  }
}
