import 'package:arcopen_employee/core/models/transaction.dart';
import 'package:arcopen_employee/modules/finances/finance_list/finance_list_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/finances/finance_card.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({Key? key}) : super(key: key);

  @override
  _FinancesScreenState createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  late int _selectedIndex;
  final FinanceListController controller = FinanceListController();

  @override
  void initState() {
    _selectedIndex = 0;
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.loadFinances();
    });
    super.initState();
  }

  void _updateActiveIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OkitoBuilder(
          controller: controller,
          builder: () {
            Widget pageContent = const SizedBox();

            Widget pageStateContainer(Widget child) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    child,
                  ],
                ),
              );
            }

            switch (controller.loadingState) {
              case LoadingState.failed:
                pageContent = pageStateContainer(
                  KButton(
                    onPressed: controller.loadFinances,
                    title: "Try again",
                    color: Okito.theme.primaryColor,
                  ),
                );
                break;
              case LoadingState.loading:
                pageContent = pageStateContainer(
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
                break;
              case LoadingState.success:
                pageContent = Column(
                  children: [
                    if (_selectedIndex == 0)
                      _PaidTab(
                        transactions: controller.paidTransactions,
                      ),
                    if (_selectedIndex == 1)
                      _UnPaidTab(
                        transactions: controller.unPaidTransactions,
                      ),
                  ],
                );
                break;
              case LoadingState.pending:
                pageContent = const SizedBox();
                break;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _BalanceCard(
                  totalJobsLabel: controller.totalJobs,
                  totalPaid: controller.totalPaid,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                  ],
                ),
                const SizedBox(height: 10),
                pageContent
              ],
            );
          },
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    Key? key,
    required this.totalJobsLabel,
    required this.totalPaid,
  }) : super(key: key);

  final String totalJobsLabel;
  final String totalPaid;

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
            const SizedBox(height: 10),
            Text(
              totalPaid.isEmpty ? "\$0" : totalPaid,
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: ColorConstants.greenColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              totalJobsLabel,
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

class _PaidTab extends StatelessWidget {
  const _PaidTab({
    Key? key,
    required this.transactions,
  }) : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty)
      return EmptyState(
        stateType: StateType.finance,
      );
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final Transaction transaction = transactions[index];
        return FinanceCard(
          company: transaction.memberName,
          jobTitle: transaction.businessName,
          createdAt: transaction.paymentDate ?? "Pending payment",
          onTap: () {
            Okito.pushNamed(KRoutes.financeDetailsRoute, arguments: {
              "transaction": transaction,
            });
          },
        );
      },
    );
  }
}

class _UnPaidTab extends StatelessWidget {
  const _UnPaidTab({
    Key? key,
    required this.transactions,
  }) : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty)
      return EmptyState(
        stateType: StateType.finance,
      );
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final Transaction transaction = transactions[index];
        return FinanceCard(
          company: transaction.memberName,
          jobTitle: transaction.businessName,
          createdAt: transaction.paymentDate ?? "Pending payment",
          onTap: () {
            Okito.pushNamed(KRoutes.financeDetailsRoute, arguments: {
              "transaction": transaction,
            });
          },
        );
      },
    );
  }
}
