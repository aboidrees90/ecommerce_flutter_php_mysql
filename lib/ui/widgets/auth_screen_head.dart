import 'package:flutter/material.dart';

class AuthScreenHead extends StatelessWidget {
  const AuthScreenHead({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
  });

  final double height;
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 3,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(height)),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
