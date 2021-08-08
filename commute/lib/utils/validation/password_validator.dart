import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordValidator {
  static final RegExp containsUpperCaseLetterRegex = new RegExp(r'(?=.*[A-Z])');
  static final RegExp containsLowerCaseLetterRegex = new RegExp(r'(?=.*[a-z])');
  static final RegExp containsNumberRegex = new RegExp(r'(?=.*\d)');
  static final RegExp containsSpecialCharacterRegex =
      new RegExp(r'(?=.*[#@$!%*?&\-_])');
  static final String _allowedSpecialCharacters = "# @ \$ ! % * ? & - _";
  static final int minimumPasswordLength = 8;
  static const String _messageKey = "message";
  static const String _shouldBePartOfMessageKey = "shouldBePartOfMessage";

  static bool areEqual(String? leftHandValue, String? rightHandValue) {
    return (leftHandValue != null && rightHandValue != null && leftHandValue == rightHandValue);
  }

  static String? getConfirmPasswordValidationMessage(BuildContext context, String? confirmPasswordValue, String? passwordValue) {
    if (confirmPasswordValue == null || confirmPasswordValue.isEmpty) {
      return AppLocalizations.of(context)!.required;
    } else if (confirmPasswordValue != passwordValue) {
      return AppLocalizations.of(context)!.passwordsDoNotMatch;
    } else {
      return null;
    }
  }

  static String? getValidationMessage(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.required;
    } else {
      return _buildMessage(
          context,
          value.length >= minimumPasswordLength,
          containsUpperCaseLetterRegex.hasMatch(value),
          containsLowerCaseLetterRegex.hasMatch(value),
          containsNumberRegex.hasMatch(value),
          containsSpecialCharacterRegex.hasMatch(value));
    }
  }

  static bool isValid(String? value) {
    return (value != null &&
        value.isNotEmpty &&
        value.length >= minimumPasswordLength &&
        containsUpperCaseLetterRegex.hasMatch(value) &&
        containsLowerCaseLetterRegex.hasMatch(value) &&
        containsNumberRegex.hasMatch(value) &&
        containsSpecialCharacterRegex.hasMatch(value));
  }

  static String? _buildMessage(
      BuildContext context,
      bool hasMinimumLength,
      bool containsUpperCaseLetter,
      bool containsLowerCaseLetter,
      bool containsNumber,
      bool containsSpecialCharacter) {
    if (hasMinimumLength &&
        containsUpperCaseLetter &&
        containsLowerCaseLetter &&
        containsNumber &&
        containsSpecialCharacter) {
      return null;
    } else {
      StringBuffer message = StringBuffer(AppLocalizations.of(context)!.passwordMustAtLeastContain_Whitespace);
      List _messageComponents = List.from([
        {
          _shouldBePartOfMessageKey: !hasMinimumLength,
          _messageKey: minimumPasswordLength.toString() + AppLocalizations.of(context)!.characters_LeadingWhitespace
        },
        {
          _shouldBePartOfMessageKey: !containsUpperCaseLetter,
          _messageKey: AppLocalizations.of(context)!.oneUppercaseCharacter_Lowercase
        },
        {
          _shouldBePartOfMessageKey: !containsLowerCaseLetter,
          _messageKey: AppLocalizations.of(context)!.oneLowercaseCharacter_Lowercase
        },
        {
          _shouldBePartOfMessageKey: !containsNumber,
        _messageKey: AppLocalizations.of(context)!.oneNumber_Lowercase
        },
        {
          _shouldBePartOfMessageKey: !containsSpecialCharacter,
          _messageKey: AppLocalizations.of(context)!.oneSpecialCharacter_Lowercase_Whitespace + _allowedSpecialCharacters
        }
      ])
          .where((messageComponent) =>
              messageComponent[_shouldBePartOfMessageKey] == true)
          .toList();

      for (int _messageComponentIndex = 0;
          _messageComponentIndex < _messageComponents.length;
          _messageComponentIndex++) {
        if (_messageComponentIndex == _messageComponents.length - 1 &&
            _messageComponents.length > 1) {
          message.write(AppLocalizations.of(context)!.and_Lowercase);
        } else if (_messageComponentIndex > 0 &&
            _messageComponentIndex < _messageComponents.length - 1) {
          message.write(", ");
        }
        message.write(_messageComponents[_messageComponentIndex][_messageKey]);
      }

      return message.toString();
    }
  }
}
