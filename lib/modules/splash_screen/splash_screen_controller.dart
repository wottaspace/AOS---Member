import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/http/exceptions/auth_exception.dart';
import 'package:arcopen_employee/http/responses/login_response.dart';
import 'package:arcopen_employee/http/responses/member_profile_response.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:okito/okito.dart';

class SplashScreenController extends OkitoController with ToastMixin {
  SplashScreenController._internal();
  static final SplashScreenController _singleton = SplashScreenController._internal();

  factory SplashScreenController() {
    return _singleton;
  }

  final AuthRepository _repository = AuthRepository();
  bool initDataFailed = false;

  Future<void> initialize() async {
    setState(() {
      initDataFailed = false;
    });

    await Future.delayed(Duration(seconds: 1));
    if (!KStorage().contains(AppConstants.firstAppOpeningKey)) {
      KRouter().push(KRoutes.stepperRoute, replace: true);
      return;
    }
    if (KStorage().contains(AppConstants.accessTokenKey)) {
      try {
        bool result = await _loadMemberProfile();
        if (result)
          KRouter().push(KRoutes.exploreRoute, replace: true);
        else
          KRouter().push(KRoutes.profileRoute, replace: true);
      } catch (e) {
        if (e.toString().contains("422")) {
          KRouter().push(KRoutes.loginRoute, replace: true);
        } else {
          setState(() {
            initDataFailed = true;
          });
          this.showErrorToast("Failed to load data. Please try again later.");
        }
      }
      return;
    }
    KRouter().push(KRoutes.loginRoute, replace: true);
  }

  Future<bool> _loadMemberProfile() async {
    bool _result = false;
    try {
      final LoginResponse loginResponse = await _repository.getLoggedUser();
      Okito.use<AuthService>().user = loginResponse.user;
      Okito.use<AuthService>().profileExists = loginResponse.profileExists;
      if (loginResponse.profileExists) {
        final MemberProfileResponse memberProfileResponse = await _repository.readMemberProfile();
        Okito.use<AuthService>().profile = memberProfileResponse.profile;
      }
      _result = loginResponse.profileExists;
    } on DioError catch (e) {
      throw new AuthException(message: "Auth failed", code: e.response?.statusCode);
    }
    return _result;
  }
}
