import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double width(double factor) => screenWidth * factor;

  double height(double factor) => screenHeight * factor;

  EdgeInsets get pagePadding => EdgeInsets.symmetric(
    horizontal: screenWidth * 0.06,
    vertical: screenHeight * 0.02,
  );

  bool get isSmallScreen => screenWidth < 360;
  bool get isTablet => screenWidth >= 600;
}