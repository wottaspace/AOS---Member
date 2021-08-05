import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/buttons/k_button.dart';
import 'package:openarc_employee/widgets/misc/dispute_card.dart';
import 'package:openarc_employee/widgets/misc/section_title.dart';

class DisputesScreen extends StatefulWidget {
  const DisputesScreen({Key? key}) : super(key: key);

  @override
  _DisputesScreenState createState() => _DisputesScreenState();
}

class _DisputesScreenState extends State<DisputesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F7FD),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      onPressed: () {},
                      color: Colors.black,
                      icon: Icon(PhosphorIcons.caret_left_bold, size: 20),
                    ),
                    Expanded(
                      child: Text(
                        "Dispute Resolution",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    KButton.regular(
                      title: "+ ADD DISPUTE",
                      onTap: () {
                        KRouter().push(KRoutes.createDisputeRoute);
                      },
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  SectionTitle(title: "OPEN"),
                  SizedBox(height: 10),
                  DisputeCard(
                    onTap: () {
                      KRouter().push(KRoutes.disputeDetailsRoute);
                    },
                    createdAt: DateTime.now(),
                    description: "Lorem ipsum dolot sit atmet consectur",
                    isClosed: false,
                    name: "Punctuality",
                  ),
                  SizedBox(height: 20),
                  DisputeCard(
                    onTap: () {
                      KRouter().push(KRoutes.disputeDetailsRoute);
                    },
                    createdAt: DateTime.now(),
                    description: "Lorem ipsum dolot sit atmet consectur",
                    isClosed: false,
                    name: "Damage property",
                  ),
                  SizedBox(height: 20),
                  SectionTitle(title: "CLOSED"),
                  SizedBox(height: 10),
                  DisputeCard(
                    onTap: () {
                      KRouter().push(KRoutes.disputeDetailsRoute);
                    },
                    createdAt: DateTime.now(),
                    description: "Lorem ipsum dolot sit atmet consectur",
                    isClosed: true,
                    name: "Damage property",
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
