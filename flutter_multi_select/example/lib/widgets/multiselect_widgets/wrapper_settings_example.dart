import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class WrapperSettingsExample extends StatelessWidget {
  const WrapperSettingsExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(
        wrapSettings: const WrapSettings(
            alignment: WrapAlignment.end, runSpacing: 15, spacing: 25),
        items: [
          SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
          SimpleMultiSelectCard(value: 'Python', label: 'Python'),
          SimpleMultiSelectCard(
            value: 'JavaScript',
            label: 'JavaScript',
          ),
          SimpleMultiSelectCard(value: 'Java', label: 'Java'),
          SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
          SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
          SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}
