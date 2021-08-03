import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:openarc_employee/constants/color_constants.dart';
import 'package:simple_moment/simple_moment.dart';

class DisputeCard extends StatelessWidget {
  const DisputeCard({
    Key? key,
    required this.createdAt,
    required this.description,
    required this.isClosed,
    required this.name,
  }) : super(key: key);

  final String name;
  final String description;
  final DateTime createdAt;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isClosed ? Color(0XFF57D095) : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2.0,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "$name",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      color: isClosed ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  Moment.fromDate(createdAt).format("dd/MM/yyyy"),
                  style: Okito.theme.textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: isClosed ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "$description",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      color: isClosed ? Colors.white : ColorConstants.greyColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
