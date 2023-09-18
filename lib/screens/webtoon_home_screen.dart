import 'package:flutter/material.dart';
import 'package:flutter_practice/models/webtoon_model.dart';
import 'package:flutter_practice/services/api_service.dart';
import 'package:flutter_practice/widgets/widget_webtoon.dart';

class WebtoonHome extends StatelessWidget {
  WebtoonHome({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToon();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Today's Webtoon!",
          style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, future) {
          if (future.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(child: MakeList(future))
              ],
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onSurface,
            ));
          }
        },
      ),
    );
  }

  ListView MakeList(AsyncSnapshot<List<WebtoonModel>> future) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: future.data!.length,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      itemBuilder: (context, index) {
        var webtoon = future.data![index];
        return WebtoonWidget(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 40,
      ),
    );
  }
}
