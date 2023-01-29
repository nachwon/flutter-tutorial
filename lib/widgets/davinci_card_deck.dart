import 'package:flutter/material.dart';
import 'package:my_app/models/card_model.dart';
import 'package:my_app/widgets/davinci_card.dart';

class DavinciCardDeck extends StatelessWidget {
  final List<CardModel> cards;

  const DavinciCardDeck({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 1,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: cards
            .map(
              (e) => DavinciCard(
                id: e.id,
                number: e.number,
                isOpen: e.isOpen,
                type: e.color == "W" ? CardType.white : CardType.black,
              ),
            )
            .toList(),
      ),
    );
  }
}
