import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const Button({super.key, required this.text, required this.onTap, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: color,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ),
    );
  }
}
