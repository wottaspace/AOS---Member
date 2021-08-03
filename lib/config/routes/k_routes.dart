import 'package:openarc_employee/modules/auth/forgot_password/reset_password_screen.dart';
import 'package:openarc_employee/modules/auth/forgot_password/reset_password_success_screen.dart';
import 'package:openarc_employee/modules/auth/login/login_screen.dart';
import 'package:openarc_employee/modules/auth/profile/profile_screen.dart';
import 'package:openarc_employee/modules/auth/register/register_screen.dart';
import 'package:openarc_employee/modules/auth/subscription/choose_plan_screen.dart';
import 'package:openarc_employee/modules/auth/subscription/upgrade_plan_screen.dart';
import 'package:openarc_employee/modules/finances/finance_details_screen.dart';
import 'package:openarc_employee/modules/home_screen.dart';
import 'package:openarc_employee/modules/jobs/explore/location_filter_screen.dart';
import 'package:openarc_employee/modules/jobs/job_details/apply_success_screen.dart';
import 'package:openarc_employee/modules/jobs/job_details/job_details_screen.dart';
import 'package:openarc_employee/modules/splash_screen.dart';

import './k_route.dart';
import './k_router.dart';

///
/// Declaring Routes
///
class KRoutes {
  static final String splashRoute = "/";

  // Login routes
  static final String loginRoute = "/login";
  static final String registerRoute = "/register";
  static final String resetPasswordRoute = "/reset-password";
  static final String resetPasswordSuccessRoute = "/reset-password-success";

  // Profile routes
  static final String profileRoute = "/profile";

  // Subscription routes
  static final String choosePlanRoute = "/choose-plan";
  static final String upgradePlanRoute = "/upgrade-plan";

  // Explore routes
  static final String exploreRoute = "/explore";
  static final String jobDetailsRoute = "/job-details";
  static final String applySuccessRoute = "/apply-success";
  static final String locationFilterRoute = "/filter-location";

  // Finance routes
  static final String financeDetailsRoute = "/finance-details";

  static registerRoutes() {
    KRouter().registerRoute(route: KRoute(name: KRoutes.splashRoute, page: SplashScreen(), isInitial: true));
    KRouter().registerRoute(route: KRoute(name: KRoutes.loginRoute, page: LoginScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.registerRoute, page: RegisterScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.resetPasswordRoute, page: ResetPasswordScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.resetPasswordSuccessRoute, page: ResetPasswordSuccessScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.profileRoute, page: ProfileScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.choosePlanRoute, page: ChoosePlanScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.upgradePlanRoute, page: UpgradePlanScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.jobDetailsRoute, page: JobDetailsScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.applySuccessRoute, page: ApplySuccessScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.exploreRoute, page: HomeScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.locationFilterRoute, page: LocationFilterScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.financeDetailsRoute, page: FinanceDetailsScreen()));
  }
}
