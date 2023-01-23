import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:my_app/widgets/davinci_card.dart';

import 'widgets/davinci_card_deck.dart';

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

            const Flexible(
              child: DavinciCardDeck(
                cards: [
                  DavinciCard(number: "1", type: CardType.white),
                  DavinciCard(number: "2", type: CardType.white),
                  DavinciCard(number: "3", type: CardType.black),
                  DavinciCard(number: "5", type: CardType.white),
                  DavinciCard(number: "3", type: CardType.black),
                  DavinciCard(number: "5", type: CardType.white),
                ],
              ),
            ),
            const Flexible(
              child: DavinciCardDeck(
                cards: [
                  DavinciCard(number: "0", type: CardType.white),
                  DavinciCard(number: "1", type: CardType.white),
                  DavinciCard(number: "2", type: CardType.white),
                  DavinciCard(number: "3", type: CardType.white),
                  DavinciCard(number: "4", type: CardType.white),
                  DavinciCard(number: "5", type: CardType.white),
                  DavinciCard(number: "6", type: CardType.white),
                  DavinciCard(number: "7", type: CardType.white),
                  DavinciCard(number: "8", type: CardType.white),
                  DavinciCard(number: "9", type: CardType.white),
                  DavinciCard(number: "10", type: CardType.white),
                  DavinciCard(number: "11", type: CardType.white),
                  DavinciCard(number: "-", type: CardType.black),
                  DavinciCard(number: "0", type: CardType.black),
                  DavinciCard(number: "1", type: CardType.black),
                  DavinciCard(number: "2", type: CardType.black),
                  DavinciCard(number: "3", type: CardType.black),
                  DavinciCard(number: "4", type: CardType.black),
                  DavinciCard(number: "5", type: CardType.black),
                  DavinciCard(number: "6", type: CardType.black),
                  DavinciCard(number: "7", type: CardType.black),
                  DavinciCard(number: "8", type: CardType.black),
                  DavinciCard(number: "9", type: CardType.black),
                  DavinciCard(number: "10", type: CardType.black),
                  DavinciCard(number: "11", type: CardType.black),
                  DavinciCard(number: "-", type: CardType.black),
                ],
              ),
            ),
            const Flexible(
              child: DavinciCardDeck(
                cards: [
                  DavinciCard(number: "1", type: CardType.white),
                  DavinciCard(number: "2", type: CardType.white),
                  DavinciCard(number: "3", type: CardType.black),
                ],
              ),
            ),
            Container(
              color: Colors.green,
              height: 100,
            ),

            // DavinciCardDeck(
            //   cards: [
            //     DavinciCard(number: "1", type: CardType.white),
            //     DavinciCard(number: "2", type: CardType.white),
            //     DavinciCard(number: "3", type: CardType.black),
            //     DavinciCard(number: "5", type: CardType.white),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
