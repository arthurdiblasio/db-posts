import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  //Background
  static Color darkBlueCustom = Color.fromRGBO(24, 41, 82, 1);
  static Color lightBlueCustom = Color.fromRGBO(240, 248, 255, 1);

  static Gradient colorBackgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.repeated,
      // stops: [
      //   -0.0319,
      //   1.0298
      // ],
      colors: [
        Color.fromRGBO(90, 33, 94, 1),
        Color.fromRGBO(152, 205, 255, 1)
      ]);
}
