import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class BasicChipsExample extends StatelessWidget {
  const BasicChipsExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
        splashColor: Colors.blue.withOpacity(0.1),
        highlightColor: Colors.blue.withOpacity(0.1),
        textStyles:const MultiSelectTextStyles(
            selectedTextStyle: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white)),
        itemsDecoration: MultiSelectDecorations(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          selectedDecoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.circular(20)),
          disabledDecoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey[500]!),
              borderRadius: BorderRadius.circular(10)),
        ),
        items: [
          MultiSelectCard(value: 'Dart', label: 'Dart'),
          MultiSelectCard(value: 'Python', label: 'Python'),
          MultiSelectCard(value: 'JavaScript', label: 'JavaScript'),
          MultiSelectCard(value: 'Java', label: 'Java'),
          MultiSelectCard(value: 'C#', label: 'C#'),
          MultiSelectCard(value: 'C++', label: 'C++'),
          MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
          MultiSelectCard(value: 'Swift', label: 'Swift'),
          MultiSelectCard(value: 'PHP', label: 'PHP'),
          MultiSelectCard(value: 'Kotlin', label: 'Kotlin')
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}
