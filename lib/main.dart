import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/core/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Loading DotEnv from .env file
  await dotenv.load();

  // Registering routes
  KRoutes.registerRoutes();

  // Running application
  runApp(Application());
}
