import 'package:commute/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Key? key;

  const ColoredSafeArea({required this.child, this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      color: CustomColors.primaryColorSwatchLight,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}