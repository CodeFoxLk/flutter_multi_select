import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class UniqueTextStylesExample extends StatelessWidget {
  const UniqueTextStylesExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(items: [
      MultiSelectCard(
        value: 'Dart',
        label: 'Dart',
        textStyles: const MultiSelectItemTextStyles(
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
      ),
      MultiSelectCard(
        value: 'Python',
        label: 'Python',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(color: Colors.lightBlue)),
      ),
      MultiSelectCard(
        value: 'JavaScript',
        label: 'JavaScript',
        textStyles: const MultiSelectItemTextStyles(
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
      ),
      MultiSelectCard(
        value: 'Java',
        label: 'Java',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(color: Colors.amber)),
      ),
      MultiSelectCard(
        value: 'Go Lang',
        label: 'Go Lang',
        textStyles: const MultiSelectItemTextStyles(
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
      ),
      MultiSelectCard(
        value: 'Swift',
        label: 'Swift',
        textStyles: const MultiSelectItemTextStyles(
            textStyle: TextStyle(color: Colors.red)),
      ),
    ], onChange: (allSelectedItems, selectedItem) {});
  }
}
