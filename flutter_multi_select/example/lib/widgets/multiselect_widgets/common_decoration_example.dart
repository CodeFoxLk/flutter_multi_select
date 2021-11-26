import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class CommonDecorationExample extends StatelessWidget {
  const CommonDecorationExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(
        prefix: MultiSelectPrefix(
          selectedPrefix: const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
        itemsDecoration: MultiSelectDecorations(
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              border: Border.all(color: Colors.green[200]!),
              borderRadius: BorderRadius.circular(20)),
          selectedDecoration: BoxDecoration(
              color: Colors.green[400],
              border: Border.all(color: Colors.green[700]!),
              borderRadius: BorderRadius.circular(5)),
          disabledDecoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey[500]!),
              borderRadius: BorderRadius.circular(10)),
        ),
        items: [
          SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
          SimpleMultiSelectCard(value: 'Python', label: 'Python'),
          SimpleMultiSelectCard(
            value: 'JavaScript',
            label: 'JavaScript',
          ),
          SimpleMultiSelectCard(value: 'Java', label: 'Java'),
          SimpleMultiSelectCard(value: 'C#', label: 'C#'),
          SimpleMultiSelectCard(value: 'C++', label: 'C++'),
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}