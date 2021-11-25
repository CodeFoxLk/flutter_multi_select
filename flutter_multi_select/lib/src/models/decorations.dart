import 'package:flutter/material.dart';
import '../const/const_values.dart';

///unique Decoration styles for each item
class MultiSelectItemDecorations {
  /// The decoration to paint child.
  final Decoration? decoration;

  /// The decoration to paint child when selected.
  final Decoration? selectedDecoration;

  /// The decoration to paint child when disabled.
  final Decoration? disabledDecoration;

  const MultiSelectItemDecorations(
      {this.decoration, this.selectedDecoration, this.disabledDecoration});
}

///common Decoration styles for the multiselect container
class MultiSelectDecorations {
  /// The decoration to paint child.
  final Decoration? decoration;

  /// The decoration to paint child when selected.
  final Decoration? selectedDecoration;

  /// The decoration to paint child when disabled.
  final Decoration? disabledDecoration;

  const MultiSelectDecorations(
      {this.decoration, this.selectedDecoration, this.disabledDecoration});

  BorderRadius _getBorderRadius() {
    return BorderRadius.circular(kCardrBorderRadius);
  }

  Decoration getDecoration(BuildContext context) {
    return decoration ??
        BoxDecoration(
          color: Colors.white,
          borderRadius: _getBorderRadius(),
        );
  }

  Decoration getSelectedDecoration(BuildContext context) {
    // ChipThemeData  _chipData = Theme.of(context).chipTheme;
    ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return selectedDecoration ??
        BoxDecoration(
            //gradient: LinearGradient(colors: [_colorScheme.primary.withOpacity(0.5), _colorScheme.primary]),
            color: _colorScheme.primary,
            borderRadius: _getBorderRadius());
  }

  Decoration getDisabledDecoration(BuildContext context) {
    return disabledDecoration ??
        BoxDecoration(
          color: Colors.grey,
          borderRadius: _getBorderRadius(),
        );
  }
}


class SimplecardinitialDecoration extends MultiSelectDecorations {
  const SimplecardinitialDecoration();

  @override
  Decoration getDecoration(BuildContext context) {
     ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return decoration ??
        BoxDecoration(
          color: _colorScheme.surface,
          borderRadius: _getBorderRadius(),
        );
  }

  @override
  Decoration getSelectedDecoration(BuildContext context) {
    // ChipThemeData  _chipData = Theme.of(context).chipTheme;
    ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return selectedDecoration ??
        BoxDecoration(
            //gradient: LinearGradient(colors: [_colorScheme.primary.withOpacity(0.5), _colorScheme.primary]),
            color: _colorScheme.primary,
            borderRadius: _getBorderRadius());
  }

  @override
  Decoration getDisabledDecoration(BuildContext context) {
    return disabledDecoration ??
        BoxDecoration(
          color: Colors.grey,
          borderRadius: _getBorderRadius(),
        );
  }
}

class CheckListViewinitialDecoration extends MultiSelectDecorations {
  const CheckListViewinitialDecoration() : super();

  @override
  Decoration getDecoration(BuildContext context) {
    final ListTileTheme tileTheme = ListTileTheme.of(context);
    return decoration ??
        BoxDecoration(
          color: tileTheme.tileColor,
        );
  }

  @override
  Decoration getSelectedDecoration(BuildContext context) {
    final ListTileTheme tileTheme = ListTileTheme.of(context);
    return selectedDecoration ??
        BoxDecoration(
          color: tileTheme.selectedTileColor,
        );
  }

  @override
  Decoration getDisabledDecoration(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return decoration ??
        BoxDecoration(
          color: themeData.disabledColor,
        );
  }
}
