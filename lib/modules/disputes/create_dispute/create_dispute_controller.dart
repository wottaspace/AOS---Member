import 'dart:io';
import 'dart:convert';

import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/http/requests/create_dispute_request.dart';
import 'package:arcopen_employee/utils/mixins/logging_mixin.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:path/path.dart';

class CreateDisputeController extends OkitoController with ToastMixin, LoggingMixin, ValidationMixin {
  static final CreateDisputeController shared = CreateDisputeController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final JobsRepository repository = JobsRepository();
  List<Job> pastJobs = [];

  List<File> images = [];
  String? jobId;

  void init() {
    _loadJobs();
  }

  set selectedJob(Job job) {
    setState(() {
      this.jobId = job.id.toString();
      jobController.text = "${job.businessName} - ${job.address}";
    });
  }

  void _loadJobs() async {
    try {
      pastJobs = (await repository.getPastJobs()).pastJobs;
      setState(() {});
    } on Exception catch (e) {
      logger.wtf(e);
      this.showErrorToast("Failed to load data. Please check your internet connection and try again later.");
    }
  }

  Future<void> pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      images = result.files.map<File>((e) => File(e.path)).toList();
      setState(() {});
    }
  }

  @override
  void dispose() {
    detailsController.clear();
    titleController.clear();
    jobController.clear();
    jobId = null;
    images.clear();
    super.dispose();
  }

  void createDispute() {
    if (jobId == null) {
      this.showWarningToast("You need to select a job first.");
      return;
    }
    if (formKey.currentState!.validate()) {
      final request = CreateDisputeRequest(
        details: detailsController.text,
        jobId: jobId!,
        title: titleController.text,
        images: images.map((e) {
          final String name = basename(e.path);
          List<int> imageBytes = e.readAsBytesSync();
          return {name: base64Encode(imageBytes)};
        }).toList(),
      );
      KLoader().show();
      repository.createDispute(request: request).then((value) {
        this.showSuccessToast(value);
        KLoader.hide();
        Okito.pop();
      }).catchError((e) {
        KLoader.hide();
        this.showErrorToast(e.message);
      });
    }
  }
}
