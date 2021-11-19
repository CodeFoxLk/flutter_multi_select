import 'package:flutter/material.dart';
import '../models/multiselect_text_styles.dart';
import '../models/decorations.dart';
import '../models/multi_select_value.dart';

class SimpleMultiSelectCard {
  final MultiSelectValue value;
  final MultiSelectDecorations? decorations;
  final MultiSelectTextStyles? textStyles;
  final String? label;
  final Widget? child;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;

  SimpleMultiSelectCard(
      {required this.value,
      this.decorations = const MultiSelectDecorations(),
      this.textStyles,
      this.label,
      this.child,
      this.margin,
      this.contentPadding}) {
    if (child == null && label == null) {
      throw FlutterError(
          'The child or label must be provided \n ex - MultiSelectValue(label : "This is the label")');
    }
  }
}
