import 'package:commute/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;

  const ColoredSafeArea({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.primaryColorSwatchLight,
      child: SafeArea(
        child: child,
      ),
    );
  }
}