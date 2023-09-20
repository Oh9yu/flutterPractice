import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

class EpisodeWidget extends StatelessWidget {
  final String id, title, rating, date, webtoonId;

  const EpisodeWidget(
      {super.key,
      required this.id,
      required this.title,
      required this.rating,
      required this.date,
      required this.webtoonId});

  void onButtonTap() async {
    await launchUrlString(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=$id');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(color: Theme.of(context).colorScheme.surface),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  offset: Offset(2, 2),
                  color: Colors.black.withOpacity(0.1))
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('$title'), Icon(Icons.chevron_right_rounded)],
            ),
          )),
    );
  }
}
