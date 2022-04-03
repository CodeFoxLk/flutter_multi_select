import '../models/decorations.dart';

abstract class MultiSelectContainer<T> {
  ///The value for multi select items. it could be String, int or any type.
  ///Also, This will be the value or list of values return onChange
  final T value;

  ///Unique decorations for each checklist card. use only if you are willing to add different decorations for each checklist.
  ///
  ///Otherwise, you can use MultiSelectDecorations in MultiSelectCheckList<T>. Since this is common for all items under in MultiSelectCheckList<T>
  final MultiSelectItemDecorations decorations;

   MultiSelectContainer({required this.value, required this.decorations,});
  
}

