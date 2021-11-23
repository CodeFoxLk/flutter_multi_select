import 'package:flutter/cupertino.dart';
import '../models/decorations.dart';
import '../models/multiselect_text_styles.dart';
import '../const/const_values.dart';

class CheckListCard<T> {
  final T value;
  final MultiSelectItemDecorations decorations;
  final MultiSelectItemTextStyles textStyles;
  final Widget? title;
  final Widget? subtitle;
  final bool leadingCheckBox;
  final bool enabled;
  bool selected;
  final bool freezeInSelected;
  final EdgeInsetsGeometry contentPadding;
  final double checkBoxGap;
  final Color? hoverColor;
  final Color? enabledColor;
  final Color? disabledColor;
  final Color? selectedColor;
  final Color? checkColor;
  final OutlinedBorder? shape;

  CheckListCard({
    required this.value,
    this.decorations = const MultiSelectItemDecorations(),
    this.textStyles = const MultiSelectItemTextStyles(),
    this.title,
    this.subtitle,
    this.selected = false,
    this.leadingCheckBox = true,
    this.enabled = true,
    this.freezeInSelected = false,
    this.contentPadding = kCheckListPadding,
    this.checkBoxGap = 10.0,
    this.hoverColor,
    this.enabledColor,
    this.disabledColor,
    this.selectedColor,
    this.checkColor,
    this.shape,
  });
}
