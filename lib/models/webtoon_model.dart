class WebtoonModel {
  final String title, thumbnail, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumbnail = json["thumb"],
        id = json["id"];
}
