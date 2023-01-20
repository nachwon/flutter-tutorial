import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
