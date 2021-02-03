import 'package:flutter/material.dart';

class ScreenUtils {
  static double screenWidth;
  static double screenHeight;

  static void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
  }
}
