import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:openarc_employee/modules/jobs/job_listing/invites_screen.dart';

class JobListingScreen extends StatefulWidget {
  const JobListingScreen({Key? key}) : super(key: key);

  @override
  _JobListingScreenState createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> with SingleTickerProviderStateMixin {
  List<bool> _isSelected = [true, false, false];
  late TabController _tabController;

  void _updateActiveIndex(int index) {
    setState(() {
      _isSelected = [false, false, false];
      _isSelected[index] = true;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    color: _isSelected[0] ? Okito.theme.primaryColor : Colors.white,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    child: Text(
                      "Invites",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _isSelected[0] ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                  Container(
                    color: _isSelected[1] ? Okito.theme.primaryColor : Colors.white,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    child: Text(
                      "TimeSheets",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _isSelected[1] ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                  Container(
                    color: _isSelected[2] ? Okito.theme.primaryColor : Colors.white,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    child: Text(
                      "History",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _isSelected[2] ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                ],
                isSelected: _isSelected,
              ),
            ),
            SizedBox(height: 20),
            _getActiveChild(),
          ],
        ),
      ),
    );
  }

  Widget _getActiveChild() {
    int _selectedIndex = _isSelected.indexOf(true);
    switch (_selectedIndex) {
      case 0:
        return InvitesScreen();
      case 1:
        return Container();
      case 2:
        return Container();
      default:
        return Container();
    }
  }
}
