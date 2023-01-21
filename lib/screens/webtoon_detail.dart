import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';
import '../services/api_service.dart';
import '../widgets/episode.dart';

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
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('liked');
    if (likedToons != null) {
      if (likedToons.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('liked', []);
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getEpisodesById(widget.id);
    initPrefs();
  }

  void onHeartTap() async {
    final likedList = prefs.getStringList('liked');
    if (likedList != null) {
      if (isLiked) {
        likedList.remove(widget.id);
      } else {
        likedList.add(widget.id);
      }
      await prefs.setStringList('liked', likedList);
    }

    isLiked = !isLiked;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
          )
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            children: [
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
              const SizedBox(height: 30),
              FutureBuilder(
                future: webtoon,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '${snapshot.data!.genre}  /  ${snapshot.data!.age}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  } else {
                    return const Text("...");
                  }
                }),
              ),
              const SizedBox(height: 30),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      for (var ep in snapshot.data!)
                        Episode(
                          episode: ep,
                          id: widget.id,
                        )
                    ]);
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
