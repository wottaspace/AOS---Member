import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/modules/jobs/explore/explore_screen.dart';
import 'package:openarc_employee/modules/jobs/invites/invites_screen.dart';
import 'package:openarc_employee/widgets/navigation/k_bottom_navbar.dart';
import 'package:openarc_employee/widgets/navigation/k_bottom_navbar_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _activeTabIndex;

  late PageController _pageController;

  @override
  void initState() {
    _activeTabIndex = 0;
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlue,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 24),
        backgroundColor: Colors.white,
        title: Text(
          "Browse jobs",
          style: Okito.theme.textTheme.headline3,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              PhosphorIcons.bell_fill,
              size: 25,
              color: ColorConstants.darkBlue.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            ExploreScreen(),
            Container(),
            InvitesScreen(),
            Container(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: KBottomNavBar(
        onTap: (index) {
          setState(() {
            _activeTabIndex = index;
            _pageController.jumpToPage(index);
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
            title: "DRAFTS",
            icon: PhosphorIcons.heart,
            isActive: _activeTabIndex == 4,
          ),
        ],
      ),
    );
  }
}
