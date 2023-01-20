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
        return Column(
          children: [
            Container(
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
              child: Image.network(webtoon.thumbnail),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(webtoon.title,
                style: const TextStyle(
                  fontSize: 22,
                )),
          ],
        );
      },
    );
  }
}
