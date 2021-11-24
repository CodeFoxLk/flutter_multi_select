import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';
import '../models/multiselect_text_styles.dart';

TextStyle getTextStyle(
    MultiSelectItemTextStyles itemTextStyles,
    MultiSelectTextStyles commonTextStyles,
    bool isSelected,
    bool enabled,
    BuildContext context) {
  final TextStyle textStyle = !enabled
      ? itemTextStyles.disabledTextStyle ??
          commonTextStyles.getDisabledTextStyle(context)
      : isSelected
          ? itemTextStyles.selectedTextStyle ??
              commonTextStyles.getSelectedTextStyle(context)
          : itemTextStyles.textStyle ?? commonTextStyles.getTextStyle(context);
  return textStyle;
}

Decoration getDecoration(
    MultiSelectItemDecorations itemDecoration,
    MultiSelectDecorations commonItemsDecoration,
    bool isSelected,
    bool enabled,
    BuildContext context) {

    const checkListViewinitialDecoration = CheckListViewinitialDecoration(
      decoration: commonItemsDecoration.decoration
    ); 
    

  final decoration = !enabled
      ? itemDecoration.disabledDecoration ??
          checkListViewinitialDecoration.getDisabledDecoration(context)
      : isSelected
          ? itemDecoration.selectedDecoration ??
              checkListViewinitialDecoration.getSelectedDecoration(context)
          : itemDecoration.decoration ??
              checkListViewinitialDecoration.getDecoration(context);
  return decoration;
}
