import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';
import '../custom_snackbar.dart';

class LimitedChoicesExample extends StatelessWidget {
  const LimitedChoicesExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
        maxSelectableCount: 5,
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
        onMaximumSelected: (allSelectedItems, selectedItem) {
          CustomSnackBar.showInSnackBar('The limit has been reached', context);
        },
        onChange: (allSelectedItems, selectedItem) {});
  }
}