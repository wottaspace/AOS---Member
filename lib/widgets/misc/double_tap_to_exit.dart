import 'dart:io';

import 'package:eyro_toast/eyro_toast.dart';
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

class _DoubleTapToExitState extends State<DoubleTapToExit> {
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
        print(_tappedTimes);
        if (_tappedTimes == 1) {
          EyroToast.showToast(
            text: "Hit back button again to quit",
            duration: ToastDuration.long,
          );
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
