import 'package:flutter/material.dart';
import 'package:arcopen_employee/widgets/misc/info_field.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';

class DisputeDetailsScreen extends StatefulWidget {
  const DisputeDetailsScreen({Key? key}) : super(key: key);

  @override
  _DisputeDetailsScreenState createState() => _DisputeDetailsScreenState();
}

class _DisputeDetailsScreenState extends State<DisputeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Damage Property",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              InfoField(title: "TITLE", contentTitle: "Damage Property"),
              SizedBox(height: 20),
              InfoField(title: "SELECT JOB", contentTitle: "Tesco's Cambridge"),
              SizedBox(height: 20),
              InfoField(
                title: "DETAILS",
                contentTitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
