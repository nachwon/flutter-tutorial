import 'package:flutter/material.dart';
import 'package:my_app/services/api_service.dart';

import '../models/webtoon_model.dart';

class WebToonHome extends StatelessWidget {
  WebToonHome({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "Today's Toon",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
          future: webtoons,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return const Text("There is data!");
            } else {
              return const Text("Loading...");
            }
          })),
    );
  }
}
