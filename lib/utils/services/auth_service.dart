import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/http/responses/login_response.dart';
import 'package:arcopen_employee/http/responses/profile_response.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:okito/okito.dart';

class AuthService {
  late User user;
  late Profile profile;
  late bool profileExists;

  void logout() {
    this.profileExists = false;
    KStorage().remove(AppConstants.accessTokenKey);
    Okito.pushNamedAndRemoveUntil(KRoutes.loginRoute, predicate: (route) => route.isFirst);
  }
}
