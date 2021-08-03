import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/misc/section_title.dart';

class InboxDetailsScreen extends StatefulWidget {
  const InboxDetailsScreen({Key? key}) : super(key: key);

  @override
  _InboxDetailsScreenState createState() => _InboxDetailsScreenState();
}

class _InboxDetailsScreenState extends State<InboxDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        PhosphorIcons.caret_left,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        KRouter().pop();
                      },
                    ),
                    CircleAvatar(),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Express Employment",
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.map_pin,
                                size: 12,
                                color: ColorConstants.greyColor,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "KITCHENER",
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  fontSize: 10.0,
                                  color: ColorConstants.greyColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      child: KButton.outlined(
                        onPressed: () {},
                        dense: true,
                        title: "VIEW PROFILE",
                        color: Okito.theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              _Line(),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Talwar's Residency job",
                          style: Okito.theme.textTheme.headline2!.copyWith(fontSize: 14.0),
                        ),
                      ),
                      KButton(
                        padding: EdgeInsets.all(2.0),
                        onPressed: () {},
                        title: "ACCEPT",
                        color: Okito.theme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              _Line(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SectionTitle(
                            title: "TUE, NOV 5",
                            textColor: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        _MessageBulb(
                          message: "Hi, How you doing",
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: SectionTitle(
                            title: "MON, NOV 9",
                            textColor: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        _MessageBulb(
                          message:
                              "Dear Sir/Mam,\nI am writing to apply for the part time position advertised on www.indeed.ca. As requested, i enclose a completed my resume.\nI am confident about providing top quality customer service by phone and in person at the counter.\nThank you for your time and consideration. I look forward to speaking with you about this employment opportunity.\n\nReferred by: Akshay Grover.\n\nSincerely,\nHarry Tahir.",
                        ),
                        SizedBox(height: 10),
                        _MessageBulb(
                          message: "Hi i looked your resume and i would like to call you on Monday 9 PM.",
                          alignment: BulbAlignment.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(
                          PhosphorIcons.plus_circle_fill,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(PhosphorIcons.paper_plane_right_fill),
                        onPressed: () {},
                      ),
                      hintText: "Write something",
                      hintStyle: Okito.theme.textTheme.bodyText2!.copyWith(color: ColorConstants.greyColor),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0XFFF5F7FD),
    );
  }
}

class _MessageBulb extends StatelessWidget {
  const _MessageBulb({
    Key? key,
    this.alignment = BulbAlignment.right,
    required this.message,
  }) : super(key: key);

  final BulbAlignment alignment;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment == BulbAlignment.left ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          color: alignment == BulbAlignment.left ? Color(0XFFF5F5F5) : Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 2.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Text(
          "$message",
          style: Okito.theme.textTheme.bodyText2!.copyWith(fontSize: 14.0),
        ),
      ),
    );
  }
}

enum BulbAlignment { left, right }

class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      decoration: BoxDecoration(
        color: ColorConstants.greyColor.withOpacity(0.5),
      ),
    );
  }
}
