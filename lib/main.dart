import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:my_app/widgets/davinci_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Davinci Code")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                DavinciCard(number: "-"),
                DavinciCard(number: "0"),
                DavinciCard(number: "1"),
                DavinciCard(number: "2"),
                DavinciCard(number: "3"),
                DavinciCard(number: "4"),
                DavinciCard(number: "5", type: CardType.white),
                DavinciCard(number: "6"),
                DavinciCard(number: "7"),
                DavinciCard(number: "8"),
                DavinciCard(number: "9"),
                DavinciCard(number: "10"),
                DavinciCard(number: "11"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
