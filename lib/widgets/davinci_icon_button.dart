import 'package:flutter/material.dart';

class DavinciIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final void Function() onTap;

  const DavinciIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: color ?? const Color.fromARGB(255, 86, 86, 86),
              ),
              Text(
                text,
                style: TextStyle(
                  color: color ?? const Color.fromARGB(255, 86, 86, 86),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
