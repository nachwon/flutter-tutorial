import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/models/message_model.dart';
import 'package:my_app/widgets/davinci_card.dart';
import 'package:my_app/widgets/davinci_game.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final channel = IOWebSocketChannel.connect(
      "wss://xl9nhexg4l.execute-api.ap-northeast-2.amazonaws.com/api/");

  List<DavinciCard> loadCards(List<dynamic> rawData) {
    return [for (String i in rawData) DavinciCard.fromId(i.toString())];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          Map<String, dynamic> resp = jsonDecode(snapshot.data);
          MessageModel message = MessageModel.fromJson(resp);

          return DavinciGame(
            channel: channel,
            mePointer: message.mePointer,
            davinciContext: message.context,
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(),
              body: GestureDetector(
                  onTap: () {
                    channel.sink.add("test");
                  },
                  child: const Text("Test")),
            ),
          );
        }
      },
    );
  }
}
