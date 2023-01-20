import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/webtoon_detail_model.dart';
import 'package:my_app/models/webtoon_episode_model.dart';
import 'package:my_app/models/webtoon_model.dart';

class ApiService {
  static const String _baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String _today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final response = await http.get(Uri.parse('$_baseUrl/$_today'));
    if (response.statusCode == 200) {
      List<WebtoonModel> webtoonInstances = [];
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final webtoonModel = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(webtoonModel);
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>> getEpisodesById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id/episodes'));
    if (response.statusCode == 200) {
      List<WebtoonEpisodeModel> episodeInstances = [];
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        final webtoonModel = WebtoonEpisodeModel.fromJson(episode);
        episodeInstances.add(webtoonModel);
      }
      return episodeInstances;
    } else {
      throw Error();
    }
  }
}
