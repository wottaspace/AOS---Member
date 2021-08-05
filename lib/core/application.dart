import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/themes/light_theme.dart';
import 'package:arcopen_employee/constants/app_constants.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OkitoMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.applicationName,
      initialRoute: KRouter().getInitialRouteName(),
      routes: KRouter().getApplicationRoutes(),
      theme: lightTheme,
    );
  }
}