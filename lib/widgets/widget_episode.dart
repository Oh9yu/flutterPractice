import 'package:flutter/material.dart';

class EpisodeWidget extends StatelessWidget {
  final String id, title, rating, date;

  const EpisodeWidget(
      {super.key,
      required this.id,
      required this.title,
      required this.rating,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        children: [
          Text('$date'),
          Text('$rating'),
          Text('$title'),
        ],
      ),
    );
  }
}
