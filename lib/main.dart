import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/core/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Loading DotEnv from .env file
  await dotenv.load();

  // Registering routes
  KRoutes.registerRoutes();

  OkitoStorage.init(storageName: "arc_open_data");

  // Running application
  runApp(Application());
}
