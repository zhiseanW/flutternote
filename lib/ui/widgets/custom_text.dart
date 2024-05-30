import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize = 14.0,
      this.color = Colors.black});

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, color: color, decoration: TextDecoration.none),
    );
  }
}
