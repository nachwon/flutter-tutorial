import 'package:flutter/material.dart';
import 'package:my_app/services/api_service.dart';
import 'package:my_app/widgets/webtoon_item.dart';

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
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Expanded(
                    child: renderWebtoonsList(snapshot),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }

  ListView renderWebtoonsList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      separatorBuilder: (context, index) => const SizedBox(width: 40),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return WebtoonItem(
          id: webtoon.id,
          thumbnail: webtoon.thumbnail,
          title: webtoon.title,
        );
      },
    );
  }
}
