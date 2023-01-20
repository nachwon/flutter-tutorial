import 'package:flutter/material.dart';
import 'package:my_app/screens/webtoon_detail.dart';

class WebtoonItem extends StatelessWidget {
  final String id;
  final String thumbnail;
  final String title;

  const WebtoonItem({
    super.key,
    required this.id,
    required this.thumbnail,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebtoonDetail(
              id: id,
              title: title,
              thumbnail: thumbnail,
            ),
            fullscreenDialog: false,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
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
              child: Image.network(thumbnail),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
