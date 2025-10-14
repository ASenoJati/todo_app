import 'package:flutter/material.dart';

class ResponsiveUtils {
  static double getResponsiveWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double getResponsiveHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    double width = MediaQuery.of(context).size.width;
    if (width < 360) {
      return baseFontSize * 0.85;
    } else if (width < 600) {
      return baseFontSize;
    } else {
      return baseFontSize * 1.15;
    }
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16);
    } else {
      return const EdgeInsets.all(24);
    }
  }

  static double getResponsiveCardWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return width * 0.9;
    } else {
      return width * 0.7;
    }
  }

  static int getCrossAxisCount(BuildContext context) {
    if (isMobile(context)) {
      return 1;
    } else {
      return 2;
    }
  }

  static double getGridAspectRatio(BuildContext context) {
    if (isMobile(context)) {
      return 2.5;
    } else {
      return 2.8;
    }
  }
}