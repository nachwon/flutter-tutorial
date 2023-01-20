import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  void getTodaysToons() async {
    final response = await http.get(Uri.parse('$baseUrl/$today'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
