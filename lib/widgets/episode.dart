import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    Key? key,
    required this.episode,
    required this.id,
  }) : super(key: key);

  final WebtoonEpisodeModel episode;
  final String id;

  void onButtonTap() async {
    await launchUrl(Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$id&no=${episode.id}"));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(1, 1))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  episode.title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Flexible(
                flex: 0,
                child: Icon(Icons.chevron_right),
              )
            ],
          ),
        ),
      ),
    );
  }
}
