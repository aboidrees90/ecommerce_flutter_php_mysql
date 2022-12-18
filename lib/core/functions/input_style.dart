import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration inputStyle({required String hintText, IconData? prefixIconData, Widget? prefixIcon, IconData? suffixIconData, Widget? suffixIcon}) {
  return InputDecoration(
    prefixIcon: prefixIcon ?? (prefixIconData != null ? Icon(prefixIconData, color: Get.theme.colorScheme.primary.withAlpha(150)) : null),
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
    suffixIcon: suffixIcon ?? Icon(suffixIconData, color: Colors.black),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 2, color: Colors.white60),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 2, color: Colors.white60),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 2, color: Get.theme.colorScheme.primary.withAlpha(100)),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 2, color: Colors.white60),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    fillColor: Colors.white,
    filled: true,
  );
}
