import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors.primaryColorSwatchLight,
      accentColor: CustomColors.primaryColorLight,
      elevatedButtonTheme: new ElevatedButtonThemeData(
        style: new ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomColors.primaryColorSwatchLight),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )
          )
        )
      )
    );
  }
}