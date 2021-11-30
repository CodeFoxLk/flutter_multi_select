import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select.dart';

class CommonDecorationExample extends StatelessWidget {
  const CommonDecorationExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
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
              gradient: LinearGradient(colors: [
                Colors.green.withOpacity(0.1),
                Colors.yellow.withOpacity(0.1),
              ]),
              border: Border.all(color: Colors.green[200]!),
              borderRadius: BorderRadius.circular(20)),
          selectedDecoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.green, Colors.lightGreen]),
              border: Border.all(color: Colors.green[700]!),
              borderRadius: BorderRadius.circular(5)),
          disabledDecoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey[500]!),
              borderRadius: BorderRadius.circular(10)),
        ),
        items: [
          MultiSelectCard(value: 'Dart', label: 'Dart'),
          MultiSelectCard(value: 'Python', label: 'Python'),
          MultiSelectCard(
            value: 'JavaScript',
            label: 'JavaScript',
          ),
          MultiSelectCard(value: 'Java', label: 'Java'),
          MultiSelectCard(value: 'C#', label: 'C#'),
          MultiSelectCard(value: 'C++', label: 'C++'),
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}
