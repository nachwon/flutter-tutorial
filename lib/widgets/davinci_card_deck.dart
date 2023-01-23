import 'package:flutter/material.dart';
import 'package:my_app/widgets/davinci_card.dart';

class DavinciCardDeck extends StatelessWidget {
  final List<DavinciCard> cards;

  const DavinciCardDeck({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 1,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: cards,
      ),
    );
  }
}
