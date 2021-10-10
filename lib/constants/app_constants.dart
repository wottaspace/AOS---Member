import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final String applicationName = dotenv.env["APPNAME"]!;

  // Intro stepper strings
  static final String stepOneTitle = "Never miss on Opportunity";
  static final String stepOneContent = "Find work in ease, chat on the go.";
  static final String stepTwoTitle = "Find job and Submit Offer";
  static final String stepTwoContent = "Stand out by replying requirers quickly and get to work";
  static final String stepThreeTitle = "Collaborate on the go";
  static final String stepThreeContent = "work at your convenience. Plan your availability.";

  // Storage constants
  static final String firstAppOpeningKey = "opening-for-the-first-time";
  static final String accessTokenKey = "access-token";
  static final String paymentMethodsKey = "payment_methods";

  // External links
  static final String supportUrl = "https://arcopenspace.com/help-support";
  static final String privacyPolicyUrl = "https://arcopenspace.com/privacy-policy";
  static final String accessibilityUrl = "https://arcopenspace.com/accessibility";
  static final String tosUrl = "https://arcopenspace.com/terms-services";
}
