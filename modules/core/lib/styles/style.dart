import 'package:flutter/material.dart' show BorderRadius, BoxDecoration, BoxShape, BuildContext, Theme;

final style = _Style.value;

class _Style {
  static _Style get value => _Style._();
  _Style._();

  BoxDecoration defaultDecoration(BuildContext context) => BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
      );
}
