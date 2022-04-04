import 'package:flutter/cupertino.dart';
import '../models/decorations.dart';
import '../models/multiselect_text_styles.dart';
import '../const/const_values.dart';
import 'multiselect_item.dart';

///check list card
class CheckListCard<T> extends MultiSelectItem<T> {
  ///Title of the check list card
  final Widget? title;

  ///Sub-title of the check list card
  final Widget? subtitle;

  ///if true - The checkbox Becomes the leading component of the and if The checkbox Becomes the trailling component of the
  final bool leadingCheckBox;

  ///Gap between checkbox and the title
  final double checkBoxGap;

  ///Hover color
  final Color? hoverColor;

  ///Enabled checkbox color
  final Color? enabledColor;

  ///Disabled checkbox color
  final Color? disabledColor;

  ///Selected checkbox color
  final Color? selectedColor;

  ///Check mark color
  final Color? checkColor;

  ///checkbox shape
  final OutlinedBorder? shape;

  ///checkbox border setting
  final BorderSide? checkBoxBorderSide;

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
  CheckListCard({
    required T value,
    MultiSelectItemDecorations decorations = const MultiSelectItemDecorations(),
    MultiSelectItemTextStyles textStyles = const MultiSelectItemTextStyles(),
    bool selected = false,
    bool enabled = true,
    EdgeInsets contentPadding = kCheckListPadding,
    bool perpetualSelected = false,
    this.title,
    this.subtitle,
    this.leadingCheckBox = true,
    this.checkBoxGap = 10.0,
    this.hoverColor,
    this.enabledColor,
    this.disabledColor,
    this.selectedColor,
    this.checkColor,
    this.shape,
    this.checkBoxBorderSide,
  }) : super(
          value: value,
          decorations: decorations,
          textStyles: textStyles,
          contentPadding: contentPadding,
          enabled: enabled,
          selected: selected,
          perpetualSelected: perpetualSelected,
        );
}
