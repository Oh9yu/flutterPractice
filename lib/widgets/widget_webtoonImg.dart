import 'package:flutter/material.dart';

class WebtoonImg extends StatelessWidget {
  final String thumb, id;

  const WebtoonImg({super.key, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        width: 250,
        clipBehavior: Clip.hardEdge,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            blurRadius: 7,
            offset: Offset(2, 2),
            color: Colors.black.withOpacity(0.3),
          )
        ]),
        child: Image.network(thumb, headers: const {
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
        }),
      ),
    );
  }
}
