import 'package:flutter/foundation.dart';

class MultiSelectController<T>{
  final bool deselectFreezedItems;
  late VoidCallback deselectAll;
  late List<T> Function() selectAll;
  late List<T> Function() getSelectedItems;

  MultiSelectController({this.deselectFreezedItems = false});
}
