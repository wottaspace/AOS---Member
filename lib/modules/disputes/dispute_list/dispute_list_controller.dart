import 'package:arcopen_employee/core/models/complaint.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/jobs_repository.dart';
import 'package:okito/okito.dart';

class DisputeListController extends OkitoController with ToastMixin {
  static final DisputeListController shared = DisputeListController();
  final JobsRepository repository = JobsRepository();

  LoadingState loadingState = LoadingState.loading;
  List<Complaint> disputes = [];

  List<Complaint> get openedDisputes => disputes.where((e) => e.status == "open").toList();
  List<Complaint> get closedDisputes => disputes.where((e) => e.status != "open").toList();

  loadDisputes() {
    setState(() {
      loadingState = LoadingState.loading;
    });
    repository.getMemberDisputes().then((value) {
      setState(() {
        loadingState = LoadingState.success;
        disputes = value.complaints;
      });
    }).catchError((e) {
      setState(() {
        loadingState = LoadingState.failed;
      });
      this.showErrorToast("Failed to load disputes. Please try again later.");
    });
  }
}
