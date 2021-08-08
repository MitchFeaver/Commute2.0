import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailValidator {
  static final RegExp _emailRegex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static String? getValidationMessage(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.required;
    }
    if (!_emailRegex.hasMatch(value)) {
      return AppLocalizations.of(context)!.enterAValidEmail;
    } else {
      return null;
    }
  }

  static bool isValid(String? value) {
    return (value != null && value.isNotEmpty && _emailRegex.hasMatch(value));
  }
}
