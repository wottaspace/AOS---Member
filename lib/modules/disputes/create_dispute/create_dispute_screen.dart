import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';

class CreateDisputeScreen extends StatefulWidget {
  const CreateDisputeScreen({Key? key}) : super(key: key);

  @override
  _CreateDisputeScreenState createState() => _CreateDisputeScreenState();
}

class _CreateDisputeScreenState extends State<CreateDisputeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F7FD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: ColorConstants.greyColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          KRouter().pop();
                        },
                        color: Colors.black,
                        icon: Icon(PhosphorIcons.caret_left_bold, size: 20),
                      ),
                      Expanded(
                        child: Text(
                          "Add Dispute",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      KButton.regular(
                        title: "SAVE",
                        onTap: () {
                          // TODO: Save dispute
                        },
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    KTextField.soft(label: "TITLE", controller: _titleController, withShadow: false),
                    const SizedBox(height: 20),
                    KTextField.soft(
                      label: "SELECT JOB",
                      controller: _jobController,
                      withShadow: false,
                      suffixIcon: PhosphorIcons.caret_down_bold,
                    ),
                    const SizedBox(height: 20),
                    KTextField.soft(
                      label: "DETAILS",
                      controller: _detailsController,
                      withShadow: false,
                      minLines: 5,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "ADD IMAGES",
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              color: ColorConstants.greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 15,
                          color: ColorConstants.greyColor,
                          icon: const Icon(PhosphorIcons.paperclip),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 15,
                          color: ColorConstants.greyColor,
                          icon: const Icon(PhosphorIcons.camera_bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage("https://images.unsplash.com/photo-1627727240040-c07d7f6f24b6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=970&q=80"),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
