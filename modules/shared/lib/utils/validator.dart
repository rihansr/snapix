import 'package:flutter/material.dart';

abstract class Validator {
  bool isEmpty(var value);
  bool isNotEmpty(var value);
  bool isMatch(var value1, var value2, {bool ignoreCase = true});
  bool isNotMatch(var value1, var value2, {bool ignoreCase = true});
  bool isContain(var value1, var value2, {bool ignoreCase = true});
  bool isNotContain(var value1, var value2, {bool ignoreCase = true});
  String? string(var value);
}

final validator = CustomValidator.validator;

class CustomValidator implements Validator {
  static CustomValidator get validator => CustomValidator._();

  CustomValidator._();

  @override
  String? string(var value, {var orElse = '', bool lowercase = false}) {
    return isEmpty(value)
        ? orElse
        : value is TextEditingController
            ? lowercase
                ? value.text.toString().trim().toLowerCase()
                : value.text.toString().trim()
            : lowercase
                ? value.toString().trim().toLowerCase()
                : value.toString().trim();
  }

  @override
  bool isEmpty(var value) {
    return value == null
        ? true
        : value is String
            ? (value.trim().isEmpty)
            : value is bool
                ? (value)
                : value is TextEditingController
                    ? (value.text.isEmpty)
                    : value is List
                        ? (value.isEmpty)
                        : (value == null);
  }

  @override
  bool isNotEmpty(var value) {
    return !isEmpty(value);
  }

  @override
  bool isContain(var value1, var value2, {bool ignoreCase = true}) {
    return isEmpty(value1) || isEmpty(value2)
        ? false
        : value1 is List
            ? value1
                .map((item) => string(item, lowercase: ignoreCase))
                .toList()
                .contains(string(value2, lowercase: ignoreCase))
            : string(value1, lowercase: ignoreCase)!
                .contains(string(value2, lowercase: ignoreCase)!);
  }

  @override
  bool isNotContain(var value1, var value2, {bool ignoreCase = true}) {
    return !isContain(value1, value2, ignoreCase: ignoreCase);
  }

  @override
  bool isMatch(var value1, var value2, {bool ignoreCase = true}) {
    return isEmpty(value1) || isEmpty(value2)
        ? false
        : string(value1, lowercase: ignoreCase) ==
            string(value2, lowercase: ignoreCase);
  }

  @override
  bool isNotMatch(var value1, var value2, {bool ignoreCase = true}) {
    return !isMatch(value1, value2, ignoreCase: ignoreCase);
  }
}
