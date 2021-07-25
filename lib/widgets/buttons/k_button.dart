import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
        child: Text(
          "$title",
          style: Okito.theme.textTheme.bodyText2!.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.4,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  static outlined({
    required VoidCallback onPressed,
    required String title,
    required Color color,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
        child: Text(
          "$title",
          style: Okito.theme.textTheme.bodyText1!.copyWith(
            color: Okito.theme.primaryColor,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(color: color, width: 1),
      ),
    );
  }
}
