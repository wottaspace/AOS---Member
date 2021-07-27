import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/config/routes/k_route.dart';
import 'package:openarc_employee/config/routes/k_router.dart';
import 'package:openarc_employee/config/routes/k_routes.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/widgets/finances/finance_card.dart';
import 'package:openarc_employee/widgets/misc/k_chip.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({Key? key}) : super(key: key);

  @override
  _FinancesScreenState createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  void _updateActiveIndex(index) {
    setState(() {
      _selectedIndex = index;
      // TODO: toggle filter between paid and unpaid bills
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            _BalanceCard(),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              height: 40,
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(8.0),
                borderWidth: 0,
                borderColor: Okito.theme.primaryColor,
                onPressed: (index) {
                  _updateActiveIndex(index);
                },
                children: [
                  Container(
                    color: _selectedIndex == 0 ? Okito.theme.primaryColor : Colors.white,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    alignment: Alignment.center,
                    child: Text(
                      "Paid",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _selectedIndex == 0 ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                  Container(
                    color: _selectedIndex == 1 ? Okito.theme.primaryColor : Colors.white,
                    width: MediaQuery.of(context).size.width * 0.4,
                    alignment: Alignment.center,
                    child: Text(
                      "Unpaid",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _selectedIndex == 1 ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                ],
                isSelected: [_selectedIndex == 0, _selectedIndex == 1],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "TRANSACTIONS",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      fontSize: 10.0,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.greyColor,
                    ),
                  ),
                ),
                KChip(
                  title: "January",
                  icon: PhosphorIcons.caret_down_fill,
                  onTap: () {},
                  iconAlignedLeading: false,
                  circularCorners: true,
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
                  createdAt: DateTime.now(),
                  onTap: () {
                    KRouter().push(KRoutes.financeDetailsRoute);
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

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "TOTAL EARNED",
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "\$1080",
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: ColorConstants.greenColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "20 jobs till jan 2020",
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                color: ColorConstants.greyColor,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
