import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class UniqueTextStylesExample extends StatelessWidget {
  const UniqueTextStylesExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(items: [
      SimpleMultiSelectCard(
        value: 'Dart',
        label: 'Dart',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.purple)),
      ),
      SimpleMultiSelectCard(
        value: 'Python',
        label: 'Python',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(color: Colors.lightBlue)),
      ),
      SimpleMultiSelectCard(
        value: 'JavaScript',
        label: 'JavaScript',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green)),
      ),
      SimpleMultiSelectCard(
        value: 'Java',
        label: 'Java',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(color: Colors.amber)),
      ),
      SimpleMultiSelectCard(
        value: 'Go Lang',
        label: 'Go Lang',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.orange)),
      ),
      SimpleMultiSelectCard(
        value: 'Swift',
        label: 'Swift',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(color: Colors.red)),
      ),
    ], onChange: (allSelectedItems, selectedItem) {});
  }
}