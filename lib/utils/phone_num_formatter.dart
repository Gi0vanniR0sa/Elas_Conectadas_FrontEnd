import 'dart:math';

import 'package:flutter/services.dart';

class PhoneNumFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = format(newValue.text);
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String format(String value) {
    value = value.replaceAll(RegExp(r'[^\d]'), ''); // Remove os characters que nao sao numeros
    var newString = '';
    if (value.isNotEmpty) {
      newString += '(${value.substring(0, min(value.length, 2))}) ';
      if (value.length > 2) {
        newString += value.substring(2, min(value.length, 11));
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}