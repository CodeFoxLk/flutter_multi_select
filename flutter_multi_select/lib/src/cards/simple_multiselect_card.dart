import 'package:flutter/material.dart';
import '../models/multiselect_prefix.dart';
import '../models/multiselect_suffix.dart';
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
  final Clip clipBehavior;
  final MultiSelectPrefix? prefix;
  final MultiSelectSuffix? suffix;
  final bool enabled;
  final Alignment? alignment;
  bool selected;
  final bool freezeInSelected;

  SimpleMultiSelectCard( 
      {required this.value,
      this.decorations = const MultiSelectItemDecorations(),
      this.textStyles = const MultiSelectItemTextStyles(),
      this.label,
      this.child,
      this.margin,
      this.clipBehavior = Clip.hardEdge,
      this.prefix,
      this.suffix,
      this.alignment, 
      this.freezeInSelected = false,
      this.selected = false,
      this.enabled = true,
      this.contentPadding}) {
    if (child == null && label == null) {
      throw FlutterError(
          'The child or label must be provided \n ex - SimpleMultiSelectCard(label: "Dart")');
    }
  }
}
