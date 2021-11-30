import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select.dart';

class StatusExample extends StatelessWidget {
  const StatusExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(items: [
      MultiSelectCard(value: 'Dart', label: 'Dart', selected: true),
      MultiSelectCard(value: 'Python', label: 'Python', enabled: false),
      MultiSelectCard(
          value: 'JavaScript', label: 'JavaScript', perpetualSelected: true),
      MultiSelectCard(value: 'Java', label: 'Java'),
      MultiSelectCard(value: 'C#', label: 'C#'),
      MultiSelectCard(value: 'C++', label: 'C++'),
      MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
      MultiSelectCard(value: 'Swift', label: 'Swift'),
      MultiSelectCard(value: 'PHP', label: 'PHP'),
      MultiSelectCard(value: 'Kotlin', label: 'Kotlin')
    ], onChange: (allSelectedItems, selectedItem) {});
  }
}
