import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class StatusExample extends StatelessWidget {
  const StatusExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(items: [
      SimpleMultiSelectCard(
          value: 'Dart', label: 'Dart', selected: true),
      SimpleMultiSelectCard(
          value: 'Python', label: 'Python', enabled: false),
      SimpleMultiSelectCard(
          value: 'JavaScript',
          label: 'JavaScript',
          freezeInSelected: true),
      SimpleMultiSelectCard(value: 'Java', label: 'Java'),
      SimpleMultiSelectCard(value: 'C#', label: 'C#'),
      SimpleMultiSelectCard(value: 'C++', label: 'C++'),
      SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
      SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
      SimpleMultiSelectCard(value: 'PHP', label: 'PHP'),
      SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
    ], onChange: (allSelectedItems, selectedItem) {});
  }
}

