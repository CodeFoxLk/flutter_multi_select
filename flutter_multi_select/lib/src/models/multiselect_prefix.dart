import 'package:flutter/cupertino.dart';

/// An optional widget to place on the line before in Multi Select Item.
class MultiSelectPrefix {
  /// Prefix widget in multi select item when it enabled 
  final Widget? enabledPrefix;
  /// Prefix widget in multi select item when it disabled 
  final Widget? disabledPrefix;
  /// Prefix widget in multi select item when it selected 
  final Widget? selectedPrefix;
  
  MultiSelectPrefix({this.enabledPrefix, this.disabledPrefix, this.selectedPrefix});
}
