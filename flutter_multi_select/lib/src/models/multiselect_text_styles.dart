import 'package:flutter/cupertino.dart';

class MultiSelectTextStyles {
  /// The TextStyle for melection card texts.
  final TextStyle textStyle;

  /// The TextStyle for melection card texts when they are selected.
  final TextStyle selectedTextStyle;

  /// The TextStyle for melection card texts if they are disabled.
  final TextStyle disabledTextStyle;

  MultiSelectTextStyles(
      {required this.textStyle,
      TextStyle? selectedTextStyle,
      TextStyle? disabledTextStyle})
      : selectedTextStyle = selectedTextStyle ?? textStyle,
        disabledTextStyle = disabledTextStyle ?? textStyle;
}
