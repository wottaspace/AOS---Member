import 'dart:io';

import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:flutter/material.dart';

class DoubleTapToExit extends StatefulWidget {
  const DoubleTapToExit({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _DoubleTapToExitState createState() => _DoubleTapToExitState();
}

class _DoubleTapToExitState extends State<DoubleTapToExit> with ToastMixin {
  late int _tappedTimes;

  @override
  void initState() {
    _tappedTimes = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: () {
        ++_tappedTimes;
        if (_tappedTimes == 1) {
          showInfoToast("Hit back button again to quit");
          Future.delayed(Duration(seconds: 1)).then((value) {
            _tappedTimes = 0;
          });
        } else if (_tappedTimes == 2) {
          exit(0);
        }
        return Future.value(false);
      },
    );
  }
}
