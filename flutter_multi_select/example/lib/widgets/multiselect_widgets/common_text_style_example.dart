import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class CommonTextStyleExample extends StatelessWidget {
  const CommonTextStyleExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(
        textStyles: const MultiSelectTextStyles(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue)),
        items: [
          SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
          SimpleMultiSelectCard(value: 'Python', label: 'Python'),
          SimpleMultiSelectCard(
              value: 'JavaScript', label: 'JavaScript'),
          SimpleMultiSelectCard(value: 'Java', label: 'Java'),
          SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
          SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
          SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}