import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/widgets/finances/finance_card.dart';
import 'package:openarc_employee/widgets/misc/k_chip.dart';
import 'package:openarc_employee/widgets/misc/section_title.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitle(title: "PAST JOBS"),
            KChip(
              title: "January",
              icon: PhosphorIcons.caret_down_bold,
              circularCorners: true,
              iconAlignedLeading: false,
              onTap: () {
                KRouter().push(KRoutes.locationFilterRoute);
              },
            ),
          ],
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return FinanceCard(
              company: "Express Employment",
              jobTitle: "Talwar's Residency",
              status: index.isEven ? "UNPAID" : "PAID",
              createdAt: DateTime.now(),
              onTap: () {
                KRouter().push(KRoutes.financeDetailsRoute);
              },
            );
          },
        ),
      ],
    );
  }
}
