// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final VoidCallback? onTap;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const Button({
    Key? key,
    required this.text,
    this.onTap,
    this.textSize = 14.0,
    this.textColor = Colors.white,
    this.color,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: color,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: padding!,
        child: onTap != null ? InkWell(onTap: onTap, borderRadius: BorderRadius.circular(30), child: buttonContent()) : buttonContent(),
      ),
    );
  }

  buttonContent() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
      child: Text(text, style: TextStyle(color: textColor, fontSize: textSize)),
    );
  }
}
