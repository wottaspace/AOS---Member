import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final String applicationName = dotenv.env["APPNAME"]!;
}