import 'package:flutter/material.dart';

InputDecoration inputStyle({required String hintText, IconData? prefixIconData, Widget? prefixIcon, IconData? suffixIconData, Widget? suffixIcon}) {
  return InputDecoration(
    prefixIcon: prefixIcon ?? Icon(prefixIconData, color: Colors.black),
    hintText: hintText,
    suffixIcon: suffixIcon ?? Icon(suffixIconData, color: Colors.black),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.white60),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.white60),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.white60),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.white60),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    fillColor: Colors.white,
    filled: true,
  );
}
