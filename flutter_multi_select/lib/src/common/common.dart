import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';
import '../models/multiselect_text_styles.dart';

TextStyle getTextStyle( MultiSelectItemTextStyles itemTextStyles, MultiSelectTextStyles containerTextStyles,
    bool isSelected,
    bool enabled,
    BuildContext context) {
  final TextStyle textStyle = !enabled
      ? itemTextStyles.disabledTextStyle ??
          containerTextStyles.getDisabledTextStyle(context)
      : isSelected
          ? itemTextStyles.selectedTextStyle ??
              containerTextStyles.getSelectedTextStyle(context)
          : itemTextStyles.textStyle ??
              containerTextStyles.getTextStyle(context);
  return textStyle;
}

Decoration getDecoration(
  MultiSelectItemDecorations itemDecoration,
    MultiSelectDecorations containerDecoration,
    
    bool isSelected,
    bool enabled,
    BuildContext context) {
  final decoration = !enabled
      ? itemDecoration.disabledDecoration ??
          containerDecoration.getDisabledDecoration(context)
      : isSelected
          ? itemDecoration.selectedDecoration ??
              containerDecoration.getSelectedDecoration(context)
          : itemDecoration.decoration ??
              containerDecoration.getDecoration(context);
  return decoration;
}
