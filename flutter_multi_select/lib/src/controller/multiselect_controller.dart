import 'package:flutter/foundation.dart';

class MultiSelectController<T>{
  final bool deselectFreezedItems;
  late VoidCallback deselectAll;
  late VoidCallback selectAll;
  late List<T> Function() getSelectedItems;

  MultiSelectController({this.deselectFreezedItems = false});
}
