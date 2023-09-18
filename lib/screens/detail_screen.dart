import 'package:flutter/material.dart';
import 'package:flutter_practice/models/webtoon_detail_model.dart';
import 'package:flutter_practice/models/webtoon_episode_model.dart';
import 'package:flutter_practice/services/api_service.dart';
import 'package:flutter_practice/widgets/widget_episode.dart';
import 'package:flutter_practice/widgets/widget_webtoonImg.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getWebtoonDetail(widget.id);
    episodes = ApiService.getWebtoonEpisode(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    print(episodes);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          '${widget.title}',
          style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                WebtoonImg(
                  thumb: widget.thumb,
                  id: widget.id,
                ),
                FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                snapshot.data!.about,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '장르 : ${snapshot.data!.genre}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '연령 : ${snapshot.data!.age}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ));
                    } else {
                      return Text('...');
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: episodes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Expanded(child: EpisodesList(snapshot)),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onSurface);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView EpisodesList(AsyncSnapshot<List<WebtoonEpisodeModel>> episodes) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: episodes.data!.length,
      itemBuilder: (context, index) {
        print('episode ${episodes.data} ');
        var episode = episodes.data![index];
        return EpisodeWidget(
            id: episode.id,
            title: episode.title,
            rating: episode.rating,
            date: episode.date);
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
    );
  }
}
