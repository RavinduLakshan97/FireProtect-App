import 'package:flutter/material.dart';
import 'dart:ui';

class Constants {
  static const orangeColor = Color(0xFFFEA800);
  static const lightOrangeColor = Color(0xFFFFECC8);
  static const inactiveGrayColor = Color(0xFFDADADA);

  static BoxDecoration getCardBoxDecoration(color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(200, 200, 200, 0.5),
          blurRadius: 15.0, // has the effect of softening the shadow
          spreadRadius: 1.0, // has the effect of extending the shadow
        )
      ],
    );
  }
}
