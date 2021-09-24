import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
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
  JobLoadingState jobLoadingState = JobLoadingState.pending;

  Future<void> loadJobs() async {
    setState(() {
      jobLoadingState = JobLoadingState.loading;
    });
    _repository.browseJobs().then((value) {
      setState(() {
        jobLoadingState = JobLoadingState.success;
        jobList = value.jobs;
        recommendedJobs = value.recommendedJobs;
      });
    }).catchError((e) {
      setState(() {
        jobLoadingState = JobLoadingState.failed;
      });
      this.showErrorToast("Sorry, we are not able to load the data.");
    });
  }
}

enum JobLoadingState {
  failed,
  loading,
  success,
  pending,
}
