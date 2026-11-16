import 'package:flutter/material.dart';

abstract class AppColor {
  static const Color primaryColor = Color(0xffFFC700);
  static const Color listGreen = Color(0xff34a851);
  static const Color secondaryColor = Color(0xffFF0051);
  static const Color gradientColor1 = Color(0xFF1B1E22);
  static const Color gradientColor2 = Color(0xFF151515);

  static const LinearGradient backgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gradientColor1,
      gradientColor2,
    ],
  );

  static final Color backgroundSolid =
  Color.lerp(gradientColor1, gradientColor2, 0)!;

}
