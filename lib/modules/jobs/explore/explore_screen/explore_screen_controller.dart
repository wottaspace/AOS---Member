import 'package:arcopen_employee/core/base_controller.dart';
import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:flutter/cupertino.dart';

class ExploreScreenController extends BaseController with ToastMixin {
  static final ExploreScreenController shared = ExploreScreenController();

  final JobsRepository _repository = JobsRepository();
  final TextEditingController searchController = TextEditingController();

  List<Job> jobList = [];
  List<Job> recommendedJobs = [];

  Future<void> loadJobs() async {
    setState(() {
      state = LoadingState.loading;
    });
    _repository.browseJobs().then((value) {
      setState(() {
        state = LoadingState.success;
        jobList = value.jobs;
        recommendedJobs = value.recommendedJobs;
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
      this.showErrorToast("Sorry, we are not able to load the data.");
    });
  }

  Future<void> filterJobs({required Map<String, dynamic> filters}) async {
    KLoader().show();
    _repository.filterJobs(filters: filters).then((value) {
      setState(() {
        jobList = value.jobs;
        recommendedJobs = value.recommendedJobs;
      });
      KLoader.hide();
    }).catchError((e) {
      KLoader.hide();
      this.showErrorToast("Sorry, we are not able to apply your filters. Please try again later.");
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
}
