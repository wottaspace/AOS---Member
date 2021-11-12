import 'package:arcopen_employee/core/models/job.dart';
import 'package:arcopen_employee/modules/jobs/job_listing/history_list/job_history_controller.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/widgets/finances/finance_card.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';
import 'package:okito/okito.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final JobHistoryController controller = JobHistoryController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.loadJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: controller,
      builder: () {
        Widget pageContent = const SizedBox();

        Widget pageStateContainer(Widget child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
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
                onPressed: controller.loadJobs,
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
            pageContent = controller.jobs.isEmpty
                ? pageStateContainer(EmptyState())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.jobs.length,
                    itemBuilder: (context, index) {
                      final Job job = controller.jobs[index];
                      return FinanceCard(
                        company: job.businessName,
                        jobTitle: job.address,
                        createdAt: job.creationDate,
                        onTap: () {
                          KRouter().push(KRoutes.historyDetailsRoute);
                        },
                      );
                    },
                  );
            break;
          case LoadingState.pending:
            pageContent = const SizedBox();
            break;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionTitle(title: "PAST JOBS"),
              ],
            ),
            SizedBox(height: 10),
            pageContent,
          ],
        );
      },
    );
  }
}
