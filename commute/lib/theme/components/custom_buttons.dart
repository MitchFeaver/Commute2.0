import 'package:flutter/material.dart';

import 'package:commute/theme/custom_colors.dart';

class CustomButtons {
  static const double buttonCornerRadius = 25;
  static const double buttonElevation = 2.5;
  static const double outlinedButtonBorderWidth = 4;

  static final primaryTextButtonStyle = TextButton.styleFrom(
    backgroundColor: CustomColors.primaryColorSwatchLight,
    elevation: CustomButtons.buttonElevation,
    primary: Colors.white,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomButtons.buttonCornerRadius)),
  );

  static final primaryOutlinedButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    elevation: CustomButtons.buttonElevation,
    primary: CustomColors.primaryOutlinedButtonColorLight,
    shadowColor: Colors.black,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomButtons.buttonCornerRadius))),
    side: BorderSide(
      color: CustomColors.primaryOutlinedButtonColorLight,
      width: CustomButtons.outlinedButtonBorderWidth,
    ),
  );
}
