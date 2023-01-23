import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

enum CardType { white, black }

const mainWhite = Colors.white;
const mainBlack = Color.fromARGB(255, 37, 37, 37);
const double cardWidth = 45;
const double cardHeight = cardWidth * 1.4444;
const double barWidth = cardWidth / 1.8;
const double numberSize = cardWidth / 1.5;

class DavinciCard extends StatefulWidget {
  final String number;
  final bool isOpen;
  final CardType type;

  const DavinciCard({
    super.key,
    required this.number,
    this.isOpen = true,
    this.type = CardType.black,
  });

  @override
  State<DavinciCard> createState() => _DavinciCardState();
}

class _DavinciCardState extends State<DavinciCard> {
  Color getColor(Color forWhite, Color forBlack) {
    return widget.type == CardType.white ? forWhite : forBlack;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: cardHeight,
      width: cardWidth,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: getColor(mainWhite, mainBlack),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 101, 101, 101),
            inset: false,
            blurStyle: BlurStyle.normal,
            blurRadius: 3,
            spreadRadius: -1,
            offset: Offset(2, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: getColor(mainWhite, mainBlack),
          width: 1,
        ),
      ),
      child: widget.isOpen
          ? _CardInnerOpen(
              number: widget.number,
              type: widget.type,
            )
          : _CardInnerClosed(
              type: widget.type,
            ),
    );
  }
}

class _CardInnerOpen extends StatefulWidget {
  final String number;
  final CardType type;

  const _CardInnerOpen({
    required this.number,
    required this.type,
  });

  @override
  State<_CardInnerOpen> createState() => _CardInnerOpenState();
}

class _CardInnerOpenState extends State<_CardInnerOpen> {
  Color getColor(Color forWhite, Color forBlack) {
    return widget.type == CardType.white ? forWhite : forBlack;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            inset: true,
            blurRadius: 7,
            offset: const Offset(0, 5),
            spreadRadius: -3,
            color: getColor(
              const Color.fromARGB(255, 157, 157, 157),
              Colors.black,
            ),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: getColor(
            mainWhite,
            mainBlack,
          ),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.number,
            style: TextStyle(
              color: getColor(
                Colors.black,
                Colors.white,
              ),
              fontSize: numberSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 2,
            width: barWidth,
            color: getColor(
              Colors.black,
              Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _CardInnerClosed extends StatefulWidget {
  final CardType type;

  const _CardInnerClosed({
    required this.type,
  });

  @override
  State<_CardInnerClosed> createState() => _CardInnerClosedState();
}

class _CardInnerClosedState extends State<_CardInnerClosed> {
  Color getColor(Color forWhite, Color forBlack) {
    return widget.type == CardType.white ? forWhite : forBlack;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: getColor(
                const Color.fromARGB(255, 114, 114, 114), Colors.black),
            inset: true,
          )
        ],
        border: Border.all(
          color: getColor(mainWhite, mainBlack),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(type: widget.type, alignment: MainAxisAlignment.start),
          _Dot(type: widget.type, alignment: MainAxisAlignment.center),
          _Dot(type: widget.type, alignment: MainAxisAlignment.end),
          _Dot(type: widget.type, alignment: MainAxisAlignment.center),
          _Dot(type: widget.type, alignment: MainAxisAlignment.start),
        ],
      ),
    );
  }
}

class _Dot extends StatefulWidget {
  final CardType type;
  final MainAxisAlignment alignment;

  const _Dot({
    required this.type,
    required this.alignment,
  });

  @override
  State<_Dot> createState() => _DotState();
}

class _DotState extends State<_Dot> {
  Color getColor(Color forWhite, Color forBlack) {
    return widget.type == CardType.white ? forWhite : forBlack;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.alignment,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                inset: true,
                color: getColor(
                  const Color.fromARGB(255, 205, 205, 205),
                  const Color.fromARGB(255, 53, 53, 53),
                ),
                blurRadius: 2,
                offset: const Offset(2, 3),
              ),
            ],
            color: getColor(Colors.white, Colors.black),
          ),
          width: 5,
          height: 5,
        ),
      ],
    );
  }
}
