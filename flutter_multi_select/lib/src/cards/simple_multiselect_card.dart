import 'package:flutter/material.dart';
import 'package:flutter_multi_select/src/models/multiselect_prefix.dart';
import 'package:flutter_multi_select/src/models/multiselect_suffix.dart';
import '../models/multiselect_text_styles.dart';
import '../models/decorations.dart';

class SimpleMultiSelectCard<T> {
  final T value;
  final MultiSelectItemDecorations decorations;
  final MultiSelectItemTextStyles textStyles;
  final String? label;
  final Widget? child;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final MultiSelectPrefix? prefix;
  final MultiSelectSuffix? suffix;

  SimpleMultiSelectCard(
      {required this.value,
      this.decorations = const MultiSelectItemDecorations(),
      this.textStyles = const MultiSelectItemTextStyles(),
      this.label,
      this.child,
      this.margin,
      this.clipBehavior,
      this.prefix,
      this.suffix,
      this.contentPadding}) {
    if (child == null && label == null) {
      throw FlutterError(
          'The child or label must be provided \n ex - MultiSelectValue(label : "This is the label")');
    }
  }
}
