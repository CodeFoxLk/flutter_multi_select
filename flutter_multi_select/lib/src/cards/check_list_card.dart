import 'package:flutter/cupertino.dart';
import '../models/decorations.dart';
import '../models/multiselect_text_styles.dart';
import '../const/const_values.dart';

///check list card
class CheckListCard<T> {
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

  ///Title of the check list card
  final Widget? title;

  ///Sub-title of the check list card
  final Widget? subtitle;

  ///if true - The checkbox Becomes the leading component of the and if The checkbox Becomes the trailling component of the
  final bool leadingCheckBox;

  ///if true - enable checklist card
  final bool enabled;

  ///if true - initially selected, Can be changed at any time
  bool selected;

  ///if true - perpetual in the selected position
  final bool perpetualSelected;

  ///Content padding
  final EdgeInsetsGeometry contentPadding;

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

  CheckListCard({
    required this.value,
    this.decorations = const MultiSelectItemDecorations(),
    this.textStyles = const MultiSelectItemTextStyles(),
    this.title,
    this.subtitle,
    this.selected = false,
    this.leadingCheckBox = true,
    this.enabled = true,
    this.perpetualSelected = false,
    this.contentPadding = kCheckListPadding,
    this.checkBoxGap = 10.0,
    this.hoverColor,
    this.enabledColor,
    this.disabledColor,
    this.selectedColor,
    this.checkColor,
    this.shape,
    this.checkBoxBorderSide,
  });
}
