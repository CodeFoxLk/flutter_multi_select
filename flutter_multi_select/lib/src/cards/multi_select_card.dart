import 'package:flutter/cupertino.dart';

class AdvanceMultiSelectCard<T> {
  final Widget child;
  final Widget? selectedChild;
  final Widget? disabledChild;
  final bool freezeInSelected;
  final T value;
  bool selected;

  AdvanceMultiSelectCard(
      {required this.value,
      required this.child,
      this.selected = false,
      this.freezeInSelected = false,
      this.selectedChild,
      this.disabledChild});
}
