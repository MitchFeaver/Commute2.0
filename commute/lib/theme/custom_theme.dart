import 'package:flutter/material.dart';

import 'package:commute/theme/custom_colors.dart';
import 'package:commute/theme/components/custom_all.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors.primaryColorSwatchLight,
      accentColor: CustomColors.primaryColorLight,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: CustomColors.defaultTextColor),
          headline2: TextStyle(
            color: CustomColors.defaultTextColor,
            fontSize: 48,
          )),
      textButtonTheme: new TextButtonThemeData(
        style: CustomButtons.primaryTextButtonStyle,
      ),
      outlinedButtonTheme: new OutlinedButtonThemeData(
        style: CustomButtons.primaryOutlinedButtonStyle,
      ),
    );
  }
}
