import 'package:flutter/services.dart';

class FormFieldHelper {
  static final FilteringTextInputFormatter preventWhitespaces = FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"));
}