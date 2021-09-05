import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/http/responses/login_response.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:okito/okito.dart';

class SplashScreenController with ToastMixin {
  SplashScreenController._internal();
  static final SplashScreenController _singleton = SplashScreenController._internal();

  factory SplashScreenController() {
    return _singleton;
  }

  final AuthRepository _repository = AuthRepository();

  Future<void> initialize() async {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      if (!KStorage().contains(AppConstants.firstAppOpeningKey)) {
        KRouter().push(KRoutes.stepperRoute, replace: true);
        return;
      }
      if (KStorage().contains(AppConstants.accessTokenKey)) {
        bool result = await _loadMemberProfile();
        if (result)
          KRouter().push(KRoutes.exploreRoute, replace: true);
        else
          KRouter().push(KRoutes.profileRoute, replace: true);
        return;
      }
      KRouter().push(KRoutes.loginRoute, replace: true);
    });
  }

  Future<bool> _loadMemberProfile() async {
    bool _result = false;
    try {
      final LoginResponse loginResponse = await _repository.getLoggedUser();
      Okito.use<AuthService>().user = loginResponse.user;
      Okito.use<AuthService>().profileExists = loginResponse.profileExists;
      _result = loginResponse.profileExists;
    } on Exception catch (e) {
      this.showErrorToast(e.toString().replaceAll("Exception: ", ""));
    }
    return _result;
  }
}
