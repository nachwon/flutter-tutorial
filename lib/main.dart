import 'package:flutter/material.dart';

import 'screens/webtoon_home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebToonHome(),
    );
  }
}
