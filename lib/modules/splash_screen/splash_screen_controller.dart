import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';

class SplashScreenController {
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
        await _loadMemberProfile();
        KRouter().push(KRoutes.exploreRoute, replace: true);
        return;
      }
      KRouter().push(KRoutes.loginRoute, replace: true);
    });
  }

  Future _loadMemberProfile() async {
    _repository.readMemberProfile();
  }
}
