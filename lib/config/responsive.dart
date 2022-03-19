import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile({
    required BuildContext context,
  }) {
    var screenSize = MediaQuery.of(context).size;
    return screenSize.width <= 767;
  }

  static bool isTablet({
    required BuildContext context,
  }) {
    var screenSize = MediaQuery.of(context).size;
    return screenSize.width > 767 && screenSize.width < 992;
  }

  static bool isDescktop({
    required BuildContext context,
  }) {
    var screenSize = MediaQuery.of(context).size;
    return screenSize.width >= 992;
  }
}
