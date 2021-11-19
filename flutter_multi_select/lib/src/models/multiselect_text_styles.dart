import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///unique text styles for each item
class MultiSelectItemTextStyles {
  final TextStyle? textStyle;

  final TextStyle? selectedTextStyle;

  final TextStyle? disabledTextStyle;

  const MultiSelectItemTextStyles(
      {this.textStyle, this.selectedTextStyle, this.disabledTextStyle});
}

///common text styles for the multiselect container
class MultiSelectTextStyles {
  /// The TextStyle for selection card texts.
  final TextStyle? textStyle;

  /// The TextStyle for selection card texts when they are selected.
  final TextStyle? selectedTextStyle;

  /// The TextStyle for selection card texts if they are disabled.
  final TextStyle? disabledTextStyle;

  const MultiSelectTextStyles(
      {this.textStyle, this.selectedTextStyle, this.disabledTextStyle});

  TextStyle getTextStyle(BuildContext context) {
    ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return textStyle ??
        TextStyle(
          color: _colorScheme.onSurface,
        );
  }

  TextStyle getSelectedTextStyle(BuildContext context) {
    ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return selectedTextStyle ??
        TextStyle(
          color: _colorScheme.onPrimary,
        );
  }
}
