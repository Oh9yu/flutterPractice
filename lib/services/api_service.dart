import 'dart:convert';

import 'package:flutter_practice/models/webtoon_detail_model.dart';
import 'package:flutter_practice/models/webtoon_episode_model.dart';
import 'package:flutter_practice/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodayToon() async {
    var webtoonInstances = <WebtoonModel>[];
    final url = Uri.parse('$baseURL/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJSON(webtoon));
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }

  static Future<WebtoonDetailModel> getWebtoonDetail(String id) async {
    final url = Uri.parse('$baseURL/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final detail = jsonDecode(response.body);
      return WebtoonDetailModel.fromJSON(detail);
    } else {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>> getWebtoonEpisode(String id) async {
    var episodeInstances = <WebtoonEpisodeModel>[];
    final url = Uri.parse('$baseURL/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodeList = jsonDecode(response.body);
      for (var episode in episodeList) {
        episodeInstances.add(WebtoonEpisodeModel.fromJSON(episode));
      }
      return episodeInstances;
    } else {
      throw Error();
    }
  }
}
