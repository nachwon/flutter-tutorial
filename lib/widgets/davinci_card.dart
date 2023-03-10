import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';

enum CardType { white, black }

const mainWhite = Colors.white;
const mainBlack = Color.fromARGB(255, 37, 37, 37);
const double cardWidth = 38;
const double cardHeight = cardWidth * 1.4444;
const double barWidth = cardWidth / 1.8;
const double numberSize = cardWidth / 1.5;

class DavinciCard extends StatefulWidget {
  final String id;
  final String number;
  final bool isOpen;
  final CardType type;

  const DavinciCard({
    super.key,
    required this.id,
    required this.number,
    this.isOpen = false,
    this.type = CardType.black,
  });

  factory DavinciCard.fromId(String id) {
    String index = id[0];
    String jokerKey = id[1];
    String color = id[2];
    String state = id[3];
    Map numMap = {
      "A": "0",
      "B": "0",
      "C": "1",
      "D": "1",
      "E": "2",
      "F": "2",
      "G": "3",
      "H": "3",
      "I": "4",
      "J": "4",
      "K": "5",
      "L": "5",
      "M": "6",
      "N": "6",
      "O": "7",
      "P": "7",
      "Q": "8",
      "R": "8",
      "S": "9",
      "T": "9",
      "U": "10",
      "V": "10",
      "W": "11",
      "X": "11"
    };

    String number;
    if (jokerKey != "3") {
      number = "-";
    } else {
      number = numMap[index];
    }

    CardType type;
    if (color == "W") {
      type = CardType.white;
    } else {
      type = CardType.black;
    }

    bool isOpen;
    if (state == "C") {
      isOpen = false;
    } else {
      isOpen = true;
    }

    return DavinciCard(id: id, number: number, isOpen: isOpen, type: type);
  }

  String export() {
    return id;
  }

  @override
  State<DavinciCard> createState() => _DavinciCardState();
}

class _DavinciCardState extends State<DavinciCard>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late bool isOpen;

  @override
  void initState() {
    super.initState();

    isOpen = widget.isOpen;

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 1, end: 1.1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isOpen = !isOpen;
        setState(() {});
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Color getColor(Color forWhite, Color forBlack) {
    return widget.type == CardType.white ? forWhite : forBlack;
  }

  void handleCardTap() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleCardTap,
      child: Transform.scale(
        scale: animation.value,
        child: Container(
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
          child: isOpen
              ? _CardInnerOpen(
                  number: widget.number,
                  type: widget.type,
                )
              : _CardInnerClosed(
                  type: widget.type,
                ),
        ),
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
          Text(widget.number,
              style: GoogleFonts.passionOne(
                textStyle: TextStyle(
                  color: getColor(
                    Colors.black,
                    Colors.white,
                  ),
                  fontSize: numberSize,
                  fontWeight: FontWeight.bold,
                ),
              )),
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
      padding: const EdgeInsets.all(10),
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
                  const Color.fromARGB(255, 71, 71, 71),
                ),
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
            ],
            color: getColor(Colors.white, Colors.black),
          ),
          width: 4,
          height: 4,
        ),
      ],
    );
  }
}
