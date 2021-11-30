import 'package:flutter/material.dart';

///unique text styles for each item
class MultiSelectItemTextStyles {
  /// Text Style for enabled multi select card.
  final TextStyle? textStyle;

  /// Text Style for selected multi select card.
  final TextStyle? selectedTextStyle;

  /// Text Style for disabled multi select card
  final TextStyle? disabledTextStyle;

  const MultiSelectItemTextStyles(
      {this.textStyle, this.selectedTextStyle, this.disabledTextStyle});
}

///common text styles for the multiselect container
class MultiSelectTextStyles {
  /// The TextStyle for selection card texts.
  final TextStyle? textStyle;

  /// The TextStyle for selection card texts when they are selected.
  final TextStyle? selectedTextStyle;

  /// The TextStyle for selection card texts if they are disabled.
  final TextStyle? disabledTextStyle;

  const MultiSelectTextStyles(
      {this.textStyle, this.selectedTextStyle, this.disabledTextStyle});

  /// The default textStyle for multi select card texts.
  TextStyle getTextStyle(BuildContext context) {
    ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return textStyle == null
        ? TextStyle(
            color: _colorScheme.onSurface,
          )
        : TextStyle(color: _colorScheme.onSurface).merge(textStyle);
  }

  /// The textStyle for disabled card texts.
  TextStyle getDisabledTextStyle(BuildContext context) {
    ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return disabledTextStyle == null
        ? TextStyle(
            color: _colorScheme.onSurface,
          )
        : TextStyle(color: _colorScheme.onSurface).merge(disabledTextStyle);
  }

  /// The textStyle for selected card texts.
  TextStyle getSelectedTextStyle(BuildContext context) {
    ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return selectedTextStyle == null
        ? TextStyle(
            color: _colorScheme.onPrimary,
          )
        : TextStyle(color: _colorScheme.onPrimary).merge(selectedTextStyle);
  }
}

class CheckListViewInitialTS extends MultiSelectTextStyles {
  const CheckListViewInitialTS();

  @override
  TextStyle getTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle style = theme.textTheme.bodyText1!;
    return textStyle ?? style;
  }

  @override
  TextStyle getSelectedTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle style = theme.textTheme.bodyText1!;
    return selectedTextStyle ?? style;
  }

  @override
  TextStyle getDisabledTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle style = theme.textTheme.bodyText1!;
    final Color? color = theme.textTheme.caption!.color;
    return disabledTextStyle ?? style.copyWith(color: color);
  }
}
