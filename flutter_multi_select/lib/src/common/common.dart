import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';
import '../models/multiselect_text_styles.dart';

TextStyle getTextStyle(
    MultiSelectItemTextStyles itemTextStyles,
    MultiSelectTextStyles commonTextStyles,
    bool isSelected,
    bool enabled,
    BuildContext context) {
  ColorScheme _colorScheme = Theme.of(context).colorScheme;
  final TextStyle textStyle = !enabled
      ? itemTextStyles.disabledTextStyle == null
          ? commonTextStyles.getDisabledTextStyle(context)
          : TextStyle(color: _colorScheme.onSurface)
              .merge(itemTextStyles.disabledTextStyle)
      : isSelected
          ? itemTextStyles.selectedTextStyle == null
              ? commonTextStyles.getSelectedTextStyle(context)
              : TextStyle(color: _colorScheme.onSurface)
                  .merge(itemTextStyles.selectedTextStyle)
          : itemTextStyles.textStyle == null
              ? commonTextStyles.getTextStyle(context)
              : TextStyle(color: _colorScheme.onPrimary)
                  .merge(itemTextStyles.textStyle);
  return textStyle;
}
