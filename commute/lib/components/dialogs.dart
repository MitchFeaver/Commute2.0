import 'package:commute/theme/components/custom_all.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void showLoadingDialog(BuildContext context, [String? message]) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (context) {
            return Material(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.center,
                child: message == null
                    ? SizedBox(
                        child: CircularProgressIndicator(
                          color: CustomColors.primaryColorLight,
                        ),
                        width: 50,
                        height: 50,
                      )
                    : Wrap(
                        children: [
                          SizedBox(
                            child: CircularProgressIndicator(
                              color: CustomColors.primaryColorLight,
                              strokeWidth: 6,
                            ),
                            width: 62,
                            height: 62,
                          ),
                          SizedBox(
                            height: CustomSpacing.spacing_12,
                          ),
                          Text(
                            message,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.white,
                                    ),
                            textAlign: TextAlign.center,
                          )
                        ],
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                      ),
              ),
            );
          }),
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
