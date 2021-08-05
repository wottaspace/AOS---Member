import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/modules/finances/finances_screen.dart';
import 'package:arcopen_employee/modules/inbox/inbox_screen.dart';
import 'package:arcopen_employee/modules/jobs/explore/explore_screen.dart';
import 'package:arcopen_employee/modules/jobs/job_listing/job_listing_screen.dart';
import 'package:arcopen_employee/modules/saved/saved_screen.dart';
import 'package:arcopen_employee/widgets/dialogs/notifications_dialog.dart';
import 'package:arcopen_employee/widgets/misc/double_tap_to_exit.dart';
import 'package:arcopen_employee/widgets/navigation/k_bottom_navbar.dart';
import 'package:arcopen_employee/widgets/navigation/k_bottom_navbar_item.dart';
import 'package:arcopen_employee/widgets/navigation/k_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _activeTabIndex;

  late PageController _pageController;
  late String _pageTitle;

  @override
  void initState() {
    _activeTabIndex = 0;
    _pageTitle = "Browse jobs";
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleTapToExit(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: ColorConstants.lightBlue,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black, size: 24),
            backgroundColor: Colors.white,
            title: Text(
              "$_pageTitle",
              style: Okito.theme.textTheme.headline3,
            ),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Notifications",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                KRouter().pop();
                              },
                              iconSize: 15,
                              icon: Icon(PhosphorIcons.x_bold),
                            ),
                          ],
                        ),
                        content: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: NotificationsDialog(),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  PhosphorIcons.bell_fill,
                  size: 25,
                  color: ColorConstants.darkBlue.withOpacity(0.3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    KRouter().push(KRoutes.profileRoute);
                  },
                  child: CircleAvatar(),
                ),
              ),
            ],
          ),
          drawer: KDrawer(),
          body: SafeArea(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _activeTabIndex = index;
                });
              },
              children: [
                ExploreScreen(),
                InboxScreen(),
                JobListingScreen(),
                FinancesScreen(),
                SavedScreen(),
              ],
            ),
          ),
          bottomNavigationBar: KBottomNavBar(
            onTap: (index) {
              setState(() {
                _activeTabIndex = index;
                _pageController.jumpToPage(index);
                _pageTitle = _getPageTitle(index);
              });
            },
            items: [
              KBottomNavBarItem(
                title: "EXPLORE",
                icon: PhosphorIcons.magnifying_glass,
                isActive: _activeTabIndex == 0,
              ),
              KBottomNavBarItem(
                title: "INBOX",
                icon: PhosphorIcons.chat_circle_fill,
                isActive: _activeTabIndex == 1,
              ),
              KBottomNavBarItem(
                title: "JOB LISTING",
                icon: PhosphorIcons.newspaper_fill,
                isActive: _activeTabIndex == 2,
              ),
              KBottomNavBarItem(
                title: "FINANCES",
                icon: PhosphorIcons.currency_eur_fill,
                isActive: _activeTabIndex == 3,
              ),
              KBottomNavBarItem(
                title: "SAVED",
                icon: PhosphorIcons.heart,
                isActive: _activeTabIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getPageTitle(int index) {
    switch (index) {
      case 0:
        return "Browse jobs";
      case 1:
        return "Inbox";
      case 2:
        return "Job listings";
      case 3:
        return "Finances";
      case 4:
        return "Saved";
    }
  }
}
