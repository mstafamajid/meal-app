import 'package:flutter/material.dart';

import '../models/meals.dart';

class BottomContent extends StatelessWidget {
  const BottomContent(
      {Key? key,
      required this.detail,
      required IconData this.icon,
      required this.mealColor})
      : super(key: key);

  final String detail;
  final IconData icon;
  final Color mealColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: mealColor,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          detail,
          style: TextStyle(color: mealColor),
        )
      ],
    );
  }
}
