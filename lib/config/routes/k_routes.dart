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

  static registerRoutes() {
    KRouter().registerRoute(route: KRoute(name: KRoutes.splashRoute, page: SplashScreen(), isInitial: true));
    KRouter().registerRoute(route: KRoute(name: KRoutes.registerRoute, page: RegisterScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.loginRoute, page: LoginScreen()));
  }
}
