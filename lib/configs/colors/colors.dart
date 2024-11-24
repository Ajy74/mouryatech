import 'package:flutter/material.dart';

class AppColor {

  //~ Light Theme Colors
  static const Color lightPrimaryColor = Color(0xFFD6DEF8);
  static const Color lightSecondaryColor = Color(0xFFBBC3DE);
  static const Color lightColor1 = Color(0xFF090A0E);
  static const Color lightColor2 = Color(0xFF4D505D);
  static const Color lightColor3 = Color(0xFF9D9CAC);
  static const Color lightColor4 = Color(0xFF7E7A8C);
  static const Color lightColor5 = Color(0xFFFA0C1B);
  static const Color lightColor6 = Color(0xFF000515);
  static const Color lightColor7 = Colors.purple;


  //~ Dark Theme Colors
  static const Color darkPrimaryColor = Color(0xFF000515);
  static const Color darkSecondaryColor = Color(0xFF1B1D2A);
  static const Color darkColor1 = Color(0xFFEFEFF5);
  static const Color darkColor2 = Color(0xFFC2C4D1);
  static const Color darkColor3 = Color(0xFFA8A9B6);
  static const Color darkColor4 = Color(0xFF8C8D99);
  static const Color darkColor5 = Color(0xFFFA0C1B);
  static const Color darkColor6 = Color(0xFF232538);
  static const Color darkColor7 = Color(0xFF2C2F3C);

  static const Color smokyBlack = Color(0xFF121212);
  static const Color jetBlack = Color(0xFF383838);
  static const Color onyxBlack = Color(0xFF2b2b2c);
  static const Color eerieBlack = Color(0xFF202022);
  static const Color orangeYellowCrayola = Color(0xFFffdb70);
  static const Color vegasGold = Color(0xFFceb15a);
  static const Color bitterSweet = Color(0xFFb84c4c);
  static const Color cyan = Colors.cyan;


  static Color getPrimaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkPrimaryColor
          : lightPrimaryColor;

  static Color getSecondaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkSecondaryColor
          : lightSecondaryColor;

  static Color getColor1(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkColor1
          : lightColor1;


  static Color getColor2(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkColor2
          : lightColor2;

  static Color getColor3(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkColor3
          : lightColor3;

  static Color getColor4(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkColor4
          : lightColor4;

  static Color getColor5(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkColor5
          : lightColor5;

  static Color getColor6(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkColor6
          : lightColor6;

  static Color getColor7(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkColor7
          : lightColor7;

}