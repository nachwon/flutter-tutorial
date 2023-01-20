import 'package:flutter/material.dart';
import 'package:my_app/models/webtoon_model.dart';
import 'package:my_app/services/api_service.dart';

class WebToonHome extends StatefulWidget {
  const WebToonHome({super.key});

  @override
  State<WebToonHome> createState() => _WebToonHomeState();
}

class _WebToonHomeState extends State<WebToonHome> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  void waitForWebtoons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

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
    );
  }
}
