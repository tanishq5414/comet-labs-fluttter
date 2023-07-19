import 'package:cometlabs/pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primaryColor: Pallete.whiteColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Pallete.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ).apply(
      // Set the default text color here
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    fontFamily: 'CarmenSans',
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(
        color: Pallete.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
