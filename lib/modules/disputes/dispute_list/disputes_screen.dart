import 'package:arcopen_employee/modules/disputes/dispute_list/dispute_list_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/misc/dispute_card.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';

class DisputesScreen extends StatefulWidget {
  const DisputesScreen({Key? key}) : super(key: key);

  @override
  _DisputesScreenState createState() => _DisputesScreenState();
}

class _DisputesScreenState extends State<DisputesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      DisputeListController.shared.loadDisputes();
    });
    super.initState();
  }

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
                      onPressed: Okito.pop,
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
                        Okito.pushNamed(KRoutes.createDisputeRoute).then((value) {
                          DisputeListController.shared.loadDisputes();
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            OkitoBuilder(
              controller: DisputeListController.shared,
              builder: () {
                Widget pageContent = const SizedBox();

                Widget pageStateContainer(Widget child) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        child,
                      ],
                    ),
                  );
                }

                switch (DisputeListController.shared.loadingState) {
                  case LoadingState.failed:
                    pageContent = pageStateContainer(
                      KButton(
                        onPressed: DisputeListController.shared.loadDisputes,
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
                    pageContent = DisputeListController.shared.disputes.isEmpty
                        ? pageStateContainer(EmptyState(
                            stateType: StateType.dispute,
                          ))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              if (DisputeListController.shared.openedDisputes.isNotEmpty) ...[
                                SectionTitle(title: "OPEN"),
                                const SizedBox(height: 10),
                                ...DisputeListController.shared.openedDisputes.map<Widget>((e) {
                                  return DisputeCard(
                                    onTap: () {
                                      Okito.pushNamed(KRoutes.disputeDetailsRoute, arguments: {
                                        "dispute": e,
                                      });
                                    },
                                    createdAt: e.createdAt,
                                    description: e.details,
                                    isClosed: e.status != "open",
                                    name: e.title,
                                  );
                                })
                              ],
                              if (DisputeListController.shared.closedDisputes.isNotEmpty) ...[
                                SectionTitle(title: "CLOSED"),
                                const SizedBox(height: 10),
                                ...DisputeListController.shared.closedDisputes.map<Widget>((e) {
                                  return DisputeCard(
                                    onTap: () {
                                      Okito.pushNamed(KRoutes.disputeDetailsRoute, arguments: {
                                        "dispute": e,
                                      });
                                    },
                                    createdAt: e.createdAt,
                                    description: e.details,
                                    isClosed: e.status != "open",
                                    name: e.title,
                                  );
                                })
                              ],
                            ],
                          );
                    break;
                  case LoadingState.pending:
                    pageContent = const SizedBox();
                    break;
                }
                return Padding(padding: EdgeInsets.all(16.0), child: pageContent);
              },
            ),
          ],
        ),
      ),
    );
  }
}
