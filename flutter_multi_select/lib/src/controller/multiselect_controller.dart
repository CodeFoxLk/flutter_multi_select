import 'package:flutter/foundation.dart';

class MultiSelectController<T>{
  final bool unSelectFreezedItems;
  late VoidCallback unSelectAll;
  late List<T> Function() getSelectedItems;

  MultiSelectController({this.unSelectFreezedItems = false});
}
