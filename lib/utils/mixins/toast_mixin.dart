import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

mixin ToastMixin {
  showToast(String content) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        "$content",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorConstants.red,
    );
    Okito.showSnackBar(snackBar: snackBar);
  }
}
