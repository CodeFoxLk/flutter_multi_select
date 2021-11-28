import 'package:flutter/material.dart';
import '../models/multiselect_prefix.dart';
import '../models/multiselect_suffix.dart';
import '../models/multiselect_text_styles.dart';
import '../models/decorations.dart';

class MultiSelectCard<T> {
  ///The value for multi select items. it could be String, int or any type. 
  ///Also, This will be the value or list of values return onChange
  final T value;
  ///Unique decorations for each Items. use only if you are willing to add different decorations for each Items. 
  ///
  ///Otherwise, you can use MultiSelectDecorations in MultiSelectContainer<T>. Since this is common for all items under in MultiSelectContainer<T>
  final MultiSelectItemDecorations decorations;
  ///Unique textStyles for each checklist card. use only if you are willing to add different textStyles for each checklist. 
  ///
  ///Otherwise, you can use MultiSelectTextStyles in MultiSelectContainer<T>. Since this is common for all items under in MultiSelectContainer<T>
  final MultiSelectItemTextStyles textStyles;
  ///label for multiselect item
  final String? label;
  ///child for multiselect item, you can use any widget as the child.
  final Widget? child;
  /// Content padding
  final EdgeInsetsGeometry? contentPadding;
  /// margin for the item
  final EdgeInsetsGeometry? margin;
  /// clipping Behavior for item
  final Clip clipBehavior;
  /// A Unique optional widget to place on the line before.
  final MultiSelectPrefix? prefix;
  /// A Unique optional widget to place on the line after.
  final MultiSelectSuffix? suffix;
  ///if true - enable checklist card
  final bool enabled;
  ///Align the [child] or  [label]
  final Alignment? alignment;
  ///if true - initially selected, Can be changed at any time
  bool selected;
  ///if true - perpetual in the selected position
  final bool perpetualSelected;
  ///item Splash color
  final Color? splashColor;
  ///Item highlight color
  final Color? highlightColor;
  ///Label gap between [prefix] or [suffix]
  final double? labelGap;

  MultiSelectCard(  
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
      this.perpetualSelected = false,
      this.selected = false,
      this.enabled = true,
      this.splashColor,
      this.highlightColor,
      this.labelGap, 
      this.contentPadding}) {
    if (child == null && label == null) {
      throw FlutterError(
          'The child or label must be provided \n ex - SimpleMultiSelectCard(label: "Dart")');
    }
  }
}
