import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class Pomodoros extends StatelessWidget {
  const Pomodoros({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Color(0xFF232B55)),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}