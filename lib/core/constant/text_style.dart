import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle get titleLarge => const TextStyle(fontSize: 60);

  static TextStyle get titleMedium => titleLarge.copyWith(fontSize: 48);

  static TextStyle get titleSmall => titleLarge.copyWith(fontSize: 40);

  static TextStyle get bodyLarge => const TextStyle(fontSize: 36);

  static TextStyle get bodyMedium => bodyLarge.copyWith(fontSize: 32);

  static TextStyle get bodySmall => bodyLarge.copyWith(fontSize: 24);

  static TextStyle get labelLarge => const TextStyle(fontSize: 20);

  static TextStyle get labelMedium => labelLarge.copyWith(fontSize: 16);

  static TextStyle get labelSmall => labelLarge.copyWith(fontSize: 12);
}
