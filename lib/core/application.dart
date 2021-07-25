import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/themes/light_theme.dart';
import 'package:openarc_employee/constants/app_constants.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.applicationName,
      initialRoute: KRouter().getInitialRouteName(),
      routes: KRouter().getApplicationRoutes(),
      theme: lightTheme,
      navigatorKey: Okito.navigatorKey,
    );
  }
}