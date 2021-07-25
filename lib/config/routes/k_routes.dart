import 'package:openarc_employee/modules/auth/forgot_password/reset_password_screen.dart';
import 'package:openarc_employee/modules/auth/forgot_password/reset_password_success_screen.dart';
import 'package:openarc_employee/modules/auth/login/login_screen.dart';
import 'package:openarc_employee/modules/auth/register/register_screen.dart';
import 'package:openarc_employee/modules/home_screen.dart';
import 'package:openarc_employee/modules/splash_screen.dart';

import './k_route.dart';
import './k_router.dart';

///
/// Declaring Routes
///
class KRoutes {
  static final String homeRoute = "/home";
  static final String loginRoute = "/login";
  static final String registerRoute = "/register";
  static final String splashRoute = "/";
  static final String resetPasswordRoute = "/reset-password";
  static final String resetPasswordSuccessRoute = "/reset-password-success";

  static registerRoutes() {
    KRouter().registerRoute(route: KRoute(name: KRoutes.splashRoute, page: SplashScreen(), isInitial: true));
    KRouter().registerRoute(route: KRoute(name: KRoutes.registerRoute, page: RegisterScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.resetPasswordRoute, page: ResetPasswordScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.resetPasswordSuccessRoute, page: ResetPasswordSuccessScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.loginRoute, page: LoginScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.homeRoute, page: HomeScreen()));
  }
}
