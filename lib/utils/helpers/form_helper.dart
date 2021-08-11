import 'package:flutter/material.dart';

class FormHelper {
  static Future<DateTime?> pickDate({
    required BuildContext context,
  }) async {
    DateTime? _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365 * 10)),
      lastDate: DateTime.now().add(Duration(days: 365 * 100)),
    );
    return _date;
  }
}
