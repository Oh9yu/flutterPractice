import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txColor;

  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.txColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45), color: bgColor),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
          child: Text(
            '$text',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: txColor),
          ),
        ));
  }
}
