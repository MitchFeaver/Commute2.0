import 'package:flutter/material.dart';

import 'package:commute/theme/custom_colors.dart';

class CustomButtons {
  static const double buttonCornerRadius = 25;
  static const double buttonElevation = 2.5;
  static const double outlinedButtonBorderWidth = 4;
  static const double buttonFontSize = 18;
  static const double disabledOpacity = 0.4;

  static final primaryTextButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (states) => states.contains(MaterialState.disabled)
          ? CustomColors.primaryColorLight.withOpacity(disabledOpacity)
          : CustomColors.primaryColorLight,
    ),
    elevation: MaterialStateProperty.resolveWith<double>((states) =>
        states.contains(MaterialState.disabled)
            ? 0
            : CustomButtons.buttonElevation
    ),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    shadowColor: MaterialStateProperty.all(Colors.black),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomButtons.buttonCornerRadius))),
    textStyle: MaterialStateProperty.all(TextStyle(
      fontSize: CustomButtons.buttonFontSize,
    )),
  );
  /*TextButton.styleFrom(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => states.contains(MaterialState.disabled) ? null : CustomColors.primaryColorLight,
    ),
    elevation: CustomButtons.buttonElevation,
    primary: Colors.white,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomButtons.buttonCornerRadius)),
    textStyle: TextStyle(
      fontSize: CustomButtons.buttonFontSize,
    ),
  );*/

  static final primaryOutlinedButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    elevation: CustomButtons.buttonElevation,
    primary: CustomColors.primaryOutlinedButtonColorLight,
    shadowColor: Colors.black,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(CustomButtons.buttonCornerRadius))),
    side: BorderSide(
      color: CustomColors.primaryOutlinedButtonColorLight,
      width: CustomButtons.outlinedButtonBorderWidth,
    ),
    textStyle: TextStyle(
      fontSize: CustomButtons.buttonFontSize,
    ),
  );

  static final ButtonStyle loginSignUpBackTextButtonStyle =
      TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          side: BorderSide.none,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: TextStyle(color: CustomColors.defaultTextColor));
}
