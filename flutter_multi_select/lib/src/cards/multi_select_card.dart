import 'package:flutter/cupertino.dart';

class AdvanceMultiSelectCard<T> {
  final Widget child;
  final Widget? selectedChild;
  final Widget? disabledChild;
  final T value;

  const AdvanceMultiSelectCard({required this.value, required this.child, this.selectedChild, this.disabledChild});
}
