import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/core/models/profile.dart';
import 'package:arcopen_employee/core/models/user.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:okito/okito.dart';

class AuthService {
  late User user;
  Profile? profile;
  late bool profileExists;

  void logout() {
    this.profileExists = false;

    KStorage().remove(AppConstants.accessTokenKey);
    KStorage().remove(AppConstants.paymentMethodsKey);
    Okito.pushNamedAndRemoveUntil(KRoutes.loginRoute, predicate: (route) => route.isFirst);
  }
}
