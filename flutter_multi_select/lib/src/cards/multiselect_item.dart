import 'package:flutter/material.dart';

import '../models/decorations.dart';
import '../models/multiselect_text_styles.dart';

abstract class MultiSelectItem<T> {
  ///The value for multi select items. it could be String, int or any type.
  ///Also, This will be the value or list of values return onChange
  final T value;

  ///Unique decorations for each checklist card. use only if you are willing to add different decorations for each checklist.
  ///
  ///Otherwise, you can use MultiSelectDecorations in MultiSelectCheckList<T>. Since this is common for all items under in MultiSelectCheckList<T>
  final MultiSelectItemDecorations decorations;

  ///Unique textStyles for each checklist card. use only if you are willing to add different textStyles for each checklist.
  ///
  ///Otherwise, you can use MultiSelectTextStyles in MultiSelectCheckList<T>. Since this is common for all items under in MultiSelectCheckList<T>
  final MultiSelectItemTextStyles textStyles;

  ///Content padding
  final EdgeInsetsGeometry? contentPadding;

  ///if true - enable checklist card
  final bool enabled;

  ///if true - initially selected, Can be changed at any time
  bool selected;

  ///if true - perpetual in the selected status
  final bool perpetualSelected;


  MultiSelectItem({
    required this.value,
    required this.decorations,
    required this.textStyles,
    this.contentPadding,
    this.enabled = true,
    this.selected = false,
    this.perpetualSelected = false
  });
}
