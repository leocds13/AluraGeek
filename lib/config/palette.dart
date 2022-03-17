import 'package:flutter/material.dart';

class Palette {
  static const String primaryFontFamily = 'Raleway';

  static const Color primaryBlue = Color(0xFF2A7AE4);
  static const Color black = Color(0xFF464646);
  static const Color offsetWhite = Color(0xFFE5E5E5);

  static const LinearGradient bannerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black],
  );
}
