import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

enum CardType { white, black }

const white = Colors.white;
const black = Color.fromARGB(255, 37, 37, 37);

class DavinciCard extends StatefulWidget {
  final String number;
  final bool isOpen;
  final CardType type;

  const DavinciCard({
    super.key,
    required this.number,
    this.isOpen = false,
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
      height: 65,
      width: 45,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: getColor(Colors.white, black),
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
          color: getColor(Colors.white, Colors.black),
          width: 1,
        ),
      ),
      child: Container(
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
            color: getColor(Colors.white, black),
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
                color: getColor(Colors.black, Colors.white),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                height: 2,
                width: 25,
                color: getColor(Colors.black, Colors.white))
          ],
        ),
      ),
    );
  }
}
