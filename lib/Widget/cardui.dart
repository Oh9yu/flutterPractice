import 'package:flutter/material.dart';

class CardUI extends StatelessWidget {
  final String title;
  final Color bgColor;
  final String cost;
  final String loc;
  final Color titleColor;
  final Color locColor;
  final IconData icon;

  const CardUI(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.cost,
      required this.loc,
      required this.titleColor,
      required this.locColor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: titleColor),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$cost',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: titleColor.withOpacity(0.8)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$loc',
                      style: TextStyle(
                          fontSize: 20,
                          color: locColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: Offset(5, 15),
                child: Icon(
                  icon,
                  color: titleColor,
                  size: 88,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
