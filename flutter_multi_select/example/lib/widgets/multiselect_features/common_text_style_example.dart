import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class CommonTextStyleExample extends StatelessWidget {
  const CommonTextStyleExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
        textStyles: const MultiSelectTextStyles(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue)),
        items: [
          MultiSelectCard(value: 'Dart', label: 'Dart'),
          MultiSelectCard(value: 'Python', label: 'Python'),
          MultiSelectCard(
              value: 'JavaScript', label: 'JavaScript'),
          MultiSelectCard(value: 'Java', label: 'Java'),
          MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
          MultiSelectCard(value: 'Swift', label: 'Swift'),
          MultiSelectCard(value: 'Kotlin', label: 'Kotlin')
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}