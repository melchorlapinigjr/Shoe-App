import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/utils/my_colors.dart';


class MyThemes {
  static ThemeData dark = ThemeData(
    fontFamily: "Avalon",
    scaffoldBackgroundColor: MyColors.black,
    primaryColor: MyColors.primary,
    brightness: Brightness.dark,
    cursorColor: MyColors.primary,
    secondaryHeaderColor: Color(0xFF33363C),
    bottomAppBarColor: MyColors.black,
    buttonColor: Colors.white,
    accentColor: MyColors.primary,
    toggleableActiveColor: MyColors.primary,
    buttonTheme: ButtonThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minWidth: 10,
        height: 10),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 50,
            height: 1.2,
            fontWeight: FontWeight.w700,
            color: Colors.white),
        headline6: TextStyle(
            color: Colors.white.withOpacity(
              0.8,
            ),
            height: 1.6,
            fontSize: 12),
        headline4: TextStyle(
            color: Colors.white.withOpacity(
              0.8,
            ),
            decoration: TextDecoration.underline,
            height: 1.6,
            fontSize: 12),
        headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            color: Colors.white),
        bodyText1: TextStyle(
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        button: TextStyle(
          color: Colors.white.withOpacity(
            0.8,
          ),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        headline2: TextStyle(
            fontSize: 32,
            height: 1.25,
            fontWeight: FontWeight.w700,
            color: Colors.white)),
  );

  static ThemeData light = ThemeData(
    fontFamily: "Avalon",
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: MyColors.primary,
    accentColor: MyColors.primary,
    secondaryHeaderColor: Color(0xFFFFFAF6),
    bottomAppBarColor: Colors.white,
    cursorColor: MyColors.primary,
    buttonColor: MyColors.black,
    toggleableActiveColor: MyColors.black,
    splashColor: MyColors.primary.withOpacity(0.1),
    highlightColor: MyColors.primary.withOpacity(0.1),
    hoverColor: MyColors.primary.withOpacity(0.1),
    buttonTheme: ButtonThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minWidth: 10,
        height: 10),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 50,
            height: 1.2,
            fontWeight: FontWeight.w700,
            color: MyColors.black),
        button: TextStyle(
          color: Color(0xFF1F232A).withOpacity(
            0.8,
          ),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        headline4: TextStyle(
            color: Color(0xFF1F232A).withOpacity(
              0.7,
            ),
            decoration: TextDecoration.underline,
            height: 1.6,
            fontSize: 12),
        headline6: TextStyle(
            color: Color(0xFF1F232A).withOpacity(
              0.7,
            ),
            height: 1.6,
            fontSize: 12),
        headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            color: MyColors.black),
        bodyText1: TextStyle(
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w600,
            color: MyColors.black),
        headline2: TextStyle(
            fontSize: 32,
            height: 1.25,
            fontWeight: FontWeight.w700,
            color: MyColors.black)),
  );
}
