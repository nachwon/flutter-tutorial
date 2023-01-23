import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/widgets/davinci_card.dart';
import 'package:my_app/widgets/davinci_user_profile.dart';

import 'widgets/davinci_card_deck.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late List<DavinciCard> opponentCards;
  late List<DavinciCard> myCards;
  late List<DavinciCard> unusedCards;

  @override
  void initState() {
    super.initState();

    unusedCards = [
      const DavinciCard(number: "0", type: CardType.white),
      const DavinciCard(number: "1", type: CardType.white),
      const DavinciCard(number: "2", type: CardType.white),
      const DavinciCard(number: "3", type: CardType.white),
      const DavinciCard(number: "4", type: CardType.white),
      const DavinciCard(number: "7", type: CardType.white),
      const DavinciCard(number: "8", type: CardType.white),
      const DavinciCard(number: "9", type: CardType.white),
      const DavinciCard(number: "-", type: CardType.white),
      const DavinciCard(number: "1", type: CardType.black),
      const DavinciCard(number: "2", type: CardType.black),
      const DavinciCard(number: "3", type: CardType.black),
      const DavinciCard(number: "4", type: CardType.black),
      const DavinciCard(number: "5", type: CardType.black),
      const DavinciCard(number: "6", type: CardType.black),
      const DavinciCard(number: "7", type: CardType.black),
      const DavinciCard(number: "8", type: CardType.black),
      const DavinciCard(number: "11", type: CardType.black),
    ];

    myCards = [
      const DavinciCard(number: "5", type: CardType.white),
      const DavinciCard(number: "6", type: CardType.white),
      const DavinciCard(number: "9", type: CardType.black),
      const DavinciCard(number: "10", type: CardType.black),
    ];
    opponentCards = [
      const DavinciCard(number: "10", type: CardType.white),
      const DavinciCard(number: "11", type: CardType.white),
      const DavinciCard(number: "-", type: CardType.black),
      const DavinciCard(number: "0", type: CardType.black),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 222, 222, 222),
        appBar: AppBar(
          title: Text(
            "DAVINCI CODE",
            style: GoogleFonts.passionOne(color: Colors.black, fontSize: 30),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      final card = unusedCards.removeLast();
                      opponentCards.add(card);
                      setState(() {});
                    },
                    child: const DavinciUserProfile(
                      username: "Test User 1",
                      invert: true,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: DavinciCardDeck(
                cards: opponentCards,
              ),
            ),
            Flexible(
              flex: 1,
              child: DavinciCardDeck(
                cards: unusedCards,
              ),
            ),
            Flexible(
              flex: 1,
              child: DavinciCardDeck(
                cards: myCards,
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      final card = unusedCards.removeLast();
                      myCards.add(card);
                      setState(() {});
                    },
                    child: const DavinciUserProfile(username: "Che1"),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
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
