import 'package:flutter/material.dart';
import '../const/const_values.dart';
import '../models/multiselect_prefix.dart';
import '../models/multiselect_suffix.dart';
import '../models/multiselect_text_styles.dart';
import '../models/decorations.dart';
import 'multiselect_container.dart';

class MultiSelectCard<T> extends MultiSelectCardContainer<T> {
  ///label for multiselect item
  final String? label;

  ///child for multiselect item, you can use any widget as the child.
  final Widget? child;

  /// margin for the item
  final EdgeInsetsGeometry? margin;

  /// clipping Behavior for item
  final Clip clipBehavior;

  /// A Unique optional widget to place on the line before.
  final MultiSelectPrefix? prefix;

  /// A Unique optional widget to place on the line after.
  final MultiSelectSuffix? suffix;

  ///Align the [child] or  [label]
  final Alignment? alignment;

  ///item Splash color
  final Color? splashColor;

  ///Item highlight color
  final Color? highlightColor;

  ///Label gap between [prefix] or [suffix]
  final double? labelGap;

  ///final [T] value --
  ///The value for multi select items. it could be String, int or any type.
  ///Also, This will be the value or list of values return onChange
  ///
  ///
  ///final MultiSelectItemDecorations decorations --
  ///Unique [Decoration] for each checklist card. use only if you are willing to add different decorations for each checklist.
  ///Otherwise, you can use MultiSelectDecorations in MultiSelectCheckList<T>. Since this is common for all items under in MultiSelectCheckList<T>
  ///
  ///
  ///final MultiSelectItemTextStyles textStyles --
  ///Unique [TextStyle]s for each checklist card. use only if you are willing to add different [TextStyle]s for each checklist.
  ///Otherwise, you can use MultiSelectTextStyles in MultiSelectCheckList<T>. Since this is common for all items under in MultiSelectCheckList<T>
  ///
  ///
  ///final [EdgeInsetsGeometry]? contentPadding --
  ///Content padding
  ///
  ///
  ///final bool enabled --
  ///if true - enable checklist card
  ///
  ///
  ///bool selected --
  ///if true - initially selected, Can be changed at any time
  ///
  ///
  ///final bool perpetualSelected --
  ///if true - perpetual in the selected status
  MultiSelectCard({
    required T value,
    MultiSelectItemDecorations decorations = const MultiSelectItemDecorations(),
    MultiSelectItemTextStyles textStyles = const MultiSelectItemTextStyles(),
    bool selected = false,
    bool enabled = true,
    EdgeInsets? contentPadding,
    bool perpetualSelected = false,
    this.label,
    this.child,
    this.margin,
    this.clipBehavior = Clip.hardEdge,
    this.prefix,
    this.suffix,
    this.alignment,
    this.splashColor,
    this.highlightColor,
    this.labelGap,
  }) : super(
          value: value,
          decorations: decorations,
          textStyles: textStyles,
          contentPadding: contentPadding,
          enabled: enabled,
          selected: selected,
          perpetualSelected: perpetualSelected,
        ) {
    if (child == null && label == null) {
      throw FlutterError(
          'The child or label must be provided \n ex - SimpleMultiSelectCard(label: "Dart")');
    }
  }
}
