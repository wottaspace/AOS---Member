import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/forms/k_text_field.dart';
import 'package:arcopen_employee/widgets/inbox/inbox_card.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            KTextField.circular(
              hintText: "Search",
              leading: PhosphorIcons.magnifying_glass,
              controller: _searchController,
            ),
            SizedBox(height: 20),
            Text(
              "ALL MESSAGES",
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                fontSize: 10.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
                color: ColorConstants.greyColor,
              ),
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InboxCard(
                  description: "Hi, this is Harry, i'm looking for someone right now please text me back",
                  sentAt: DateTime.now(),
                  title: "XYZ employment",
                  userPictureUrl: "userPictureUrl",
                  onTap: () {
                    // TODO: go to chat details
                    KRouter().push(KRoutes.inboxDetailsRoute);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
