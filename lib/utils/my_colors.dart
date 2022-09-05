import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors {
  MyColors._();

  static bool get isDark => Get.theme.brightness == Brightness.dark;

  static const MaterialColor primaryColor = MaterialColor(0xFFFFC491, {
    100: primary,
    200: primary,
  });

  static const Color lightGrey = Color(0xFFE8E9E9);
  static const Color primary = Color(0xFFFFC491);
  static const Color black = Color(0xFF1C2026);
  static const Color gray3 = Color(0xFF828282);
  static const Color red = Color(0xFFFF594F);
  static const Color textFieldBorder = Color(0xFFE8E9E9);
  static const Color facebook = Color(0xFF1877F2);
  static const Color coverColor =Color(0xFF1A315A);
}
