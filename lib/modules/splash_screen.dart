import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        KRouter().push(KRoutes.loginRoute);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Container(
              width: 200,
              height: 80,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
