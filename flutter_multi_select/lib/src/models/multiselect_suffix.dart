import 'package:flutter/cupertino.dart';

/// An optional widget to place on the line after in Multi Select Item.
class MultiSelectSuffix {
  /// Suffix widget in multi select item when it enabled
  final Widget? enabledSuffix;

  /// Suffix widget in multi select item when it disabled
  final Widget? disabledSuffix;

  /// Suffix widget in multi select item when it selected
  final Widget? selectedSuffix;

  MultiSelectSuffix(
      {this.enabledSuffix, this.disabledSuffix, this.selectedSuffix});
}
