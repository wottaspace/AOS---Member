import 'package:arcopen_employee/modules/auth/forgot_password/reset_password_screen.dart';
import 'package:arcopen_employee/modules/auth/forgot_password/reset_password_success_screen.dart';
import 'package:arcopen_employee/modules/auth/login/login_screen.dart';
import 'package:arcopen_employee/modules/auth/profile/profile_screen.dart';
import 'package:arcopen_employee/modules/auth/register/register_screen.dart';
import 'package:arcopen_employee/modules/auth/subscription/choose_plan_screen.dart';
import 'package:arcopen_employee/modules/auth/subscription/payment/pay_screen.dart';
import 'package:arcopen_employee/modules/auth/subscription/upgrade_plan_screen.dart';
import 'package:arcopen_employee/modules/disputes/create_dispute/create_dispute_screen.dart';
import 'package:arcopen_employee/modules/disputes/dispute_details/dispute_details_screen.dart';
import 'package:arcopen_employee/modules/disputes/dispute_list/disputes_screen.dart';
import 'package:arcopen_employee/modules/finances/finance_details_screen.dart';
import 'package:arcopen_employee/modules/home_screen.dart';
import 'package:arcopen_employee/modules/inbox/inbox_details/inbox_details_screen.dart';
import 'package:arcopen_employee/modules/invites/invite_friends_screen.dart';
import 'package:arcopen_employee/modules/jobs/explore/filter/filter_screen.dart';
import 'package:arcopen_employee/modules/jobs/explore/location_filter_screen.dart';
import 'package:arcopen_employee/modules/jobs/job_details/apply_success_screen.dart';
import 'package:arcopen_employee/modules/jobs/job_details/job_details_screen.dart';
import 'package:arcopen_employee/modules/jobs/job_listing/history_details/history_details_screen.dart';
import 'package:arcopen_employee/modules/settings/add_card/add_card_screen.dart';
import 'package:arcopen_employee/modules/settings/bank_details/bank_details_screen.dart';
import 'package:arcopen_employee/modules/settings/change_password/change_password_screen.dart';
import 'package:arcopen_employee/modules/settings/settings_screen.dart';
import 'package:arcopen_employee/modules/splash_screen/splash_screen.dart';
import 'package:arcopen_employee/modules/start_screen.dart';

import './k_route.dart';
import './k_router.dart';

///
/// Declaring Routes
///
class KRoutes {
  static final String splashRoute = "/";
  static final String stepperRoute = "/intro";

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
  static final String filterRoute = "/filter";
  static final String historyDetailsRoute = "/history-details";

  // Finance routes
  static final String financeDetailsRoute = "/finance-details";

  static final String inboxDetailsRoute = "/inbox-details";

  static final String settingsRoute = "/settings";
  static final String bankDetailsRoute = "/bank-details";
  static final String changePasswordRoute = "/change-password";
  
  static final String disputesRoute = "/disputes";
  static final String createDisputeRoute = "/create-dispute";
  static final String disputeDetailsRoute = "/dispute-details";

  static final String inviteFriendsRoute = "/invite-friends";

  static final String payRoute = "/pay";
  static final String addPaymentMethodRoute = "/add-payment-method-route";

  static registerRoutes() {
    KRouter().registerRoute(route: KRoute(name: KRoutes.splashRoute, page: SplashScreen(), isInitial: true));
    KRouter().registerRoute(route: KRoute(name: KRoutes.stepperRoute, page: StartScreen(), isInitial: true));
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
    KRouter().registerRoute(route: KRoute(name: KRoutes.historyDetailsRoute, page: HistoryDetailsScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.locationFilterRoute, page: LocationFilterScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.filterRoute, page: FilterScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.financeDetailsRoute, page: FinanceDetailsScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.inboxDetailsRoute, page: InboxDetailsScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.settingsRoute, page: SettingsScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.bankDetailsRoute, page: BankDetailsScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.changePasswordRoute, page: ChangePasswordScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.disputesRoute, page: DisputesScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.createDisputeRoute, page: CreateDisputeScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.disputeDetailsRoute, page: DisputeDetailsScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.inviteFriendsRoute, page: InviteFriendsScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.payRoute, page: PayScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.addPaymentMethodRoute, page: AddCardScreen()));
  }
}
