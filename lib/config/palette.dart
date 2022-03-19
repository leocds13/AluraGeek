import 'package:alura_geek/config/responsive.dart';
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

  static double screenPaddingHorizontal(BuildContext context) =>
      Responsive.isMobile(context: context)
          ? 20
          : Responsive.isTablet(context: context)
              ? 32
              : 152;

  static double screenPaddingVertical(BuildContext context) =>
      Responsive.isMobile(context: context)
          ? 20
          : Responsive.isTablet(context: context)
              ? 32
              : 64;
}
