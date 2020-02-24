import 'package:flutter/material.dart';
import 'dart:math';

abstract class CustomColors{
  CustomColors._();

  // System
  static const PRIMARY_COLOR = Colors.blue;
  static const BACKGROUND_COLOR = Colors.white;
  static const PRIMARY_TEXT_COLOR = Colors.black;

  // Global Colors
  static const TITLE_COLOR = PRIMARY_TEXT_COLOR;

  // Tab Bar
  static const TAB_BAR_BACKGROUND_COLOR = Colors.blueGrey;
  static const TAB_UNSELECTED_COLOR = Color(0xFF9A9A9A);
  static const TAB_SELECTED_COLOR = Colors.amberAccent;
  static const APP_BAR_COLOR = Colors.blueGrey;

  static Color darker(Color c) {
    return change(c, 0.8);
  }

  static Color lighter(Color c) {
    return change(c, 1.2);
  }

  static Color change(Color c, double ratio) {
    assert(ratio > 0);
    return Color.fromARGB(
      c.alpha,
      min((c.red * ratio).round(), 0xFF),
      min((c.green * ratio).round(), 0xFF),
      min((c.blue * ratio).round(), 0xFF),
    );
  }


}