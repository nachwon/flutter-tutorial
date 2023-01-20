import 'package:flutter/material.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';
import '../services/api_service.dart';

class WebtoonDetail extends StatefulWidget {
  final String id, title, thumbnail;

  const WebtoonDetail({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  @override
  State<WebtoonDetail> createState() => _WebtoonDetailState();
}

class _WebtoonDetailState extends State<WebtoonDetail> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(5, 5),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  width: 250,
                  child: Image.network(widget.thumbnail),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
