import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppTheme {
  static const Color white = Color(0xFFFFFFFF);
  static const Color containerColor = Color(0xFF00081C);
  static const Color buttonColor = Color(0xFFFEC501);
  static const Color buttonTextColor = Color(0xFF564300);
  static const Color ellipseGlowColor = Color(0xFFF4D89C);

  static const GradientBoxBorder borderGradient = GradientBoxBorder(
    gradient: LinearGradient(
        colors: [Color(0xFFFEC501), Color(0xFF666666)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    ),
    width: 1,


  );
}