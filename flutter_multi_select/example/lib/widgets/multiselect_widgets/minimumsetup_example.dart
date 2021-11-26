import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class MinimumSetupExample extends StatelessWidget {
  const MinimumSetupExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(items: [
      SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
      SimpleMultiSelectCard(value: 'Python', label: 'Python'),
      SimpleMultiSelectCard(value: 'JavaScript', label: 'JavaScript'),
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
