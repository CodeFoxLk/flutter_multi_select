import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';
import '../custom_snackbar.dart';

class LimitedChoicesExample extends StatelessWidget {
  const LimitedChoicesExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(
        maxSelectingCount: 5,
        items: [
          SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
          SimpleMultiSelectCard(value: 'Python', label: 'Python'),
          SimpleMultiSelectCard(
              value: 'JavaScript', label: 'JavaScript'),
          SimpleMultiSelectCard(value: 'Java', label: 'Java'),
          SimpleMultiSelectCard(value: 'C#', label: 'C#'),
          SimpleMultiSelectCard(value: 'C++', label: 'C++'),
          SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
          SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
          SimpleMultiSelectCard(value: 'PHP', label: 'PHP'),
          SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
        ],
        onMaximumSelected: (allSelectedItems, selectedItem) {
          CustomSnackBar.showInSnackBar(
              'The limit has been reached', context);
        },
        onChange: (allSelectedItems, selectedItem) {});
  }
}