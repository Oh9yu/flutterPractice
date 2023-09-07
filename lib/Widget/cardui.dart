import 'package:flutter/material.dart';

class CardUI extends StatelessWidget {
  final String title;
  final Color bgColor;
  final String cost;
  final String loc;
  final Color titleColor;
  final Color locColor;

  const CardUI(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.cost,
      required this.loc,
      required this.titleColor,
      required this.locColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
