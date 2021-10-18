import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:okito/okito.dart';

class BaseController extends OkitoController with ToastMixin, ValidationMixin {
  LoadingState state = LoadingState.loading;
}