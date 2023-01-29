import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/davinci_context.dart';
import 'package:my_app/models/player.dart';
import 'package:web_socket_channel/io.dart';

import 'davinci_card_deck.dart';
import 'davinci_icon_button.dart';
import 'davinci_user_profile.dart';

class DavinciGame extends StatelessWidget {
  final IOWebSocketChannel channel;
  final int mePointer;
  final DavinciContext davinciContext;

  const DavinciGame({
    super.key,
    required this.channel,
    required this.mePointer,
    required this.davinciContext,
  });

  Player get me => davinciContext.players[mePointer];
  Player get opponent => davinciContext.players[mePointer == 1 ? 0 : 1];

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
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: DavinciUserProfile(
                      username: opponent.username,
                      invert: true,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: DavinciCardDeck(
                cards: opponent.cards,
              ),
            ),
            Flexible(
              flex: 1,
              child: DavinciCardDeck(
                cards: davinciContext.unusedCards,
              ),
            ),
            Flexible(
              flex: 1,
              child: DavinciCardDeck(cards: me.cards),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 60,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: DavinciUserProfile(username: me.username),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DavinciIconButton(
                      text: "Chat",
                      icon: Icons.chat_outlined,
                      onTap: () {
                        channel.sink.add(jsonEncode({"command": "INIT"}));
                      },
                    ),
                  ),
                  Expanded(
                    child: DavinciIconButton(
                      text: "End Turn",
                      icon: Icons.restart_alt_sharp,
                      color: const Color.fromARGB(255, 196, 7, 7),
                      onTap: () {
                        channel.sink.add("test");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
