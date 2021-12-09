import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class WrapperSettingsExample extends StatelessWidget {
  const WrapperSettingsExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
        wrapSettings: const WrapSettings(
            alignment: WrapAlignment.end, runSpacing: 15, spacing: 25),
        items: [
          MultiSelectCard(value: 'Dart', label: 'Dart'),
          MultiSelectCard(value: 'Python', label: 'Python'),
          MultiSelectCard(
            value: 'JavaScript',
            label: 'JavaScript',
          ),
          MultiSelectCard(value: 'Java', label: 'Java'),
          MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
          MultiSelectCard(value: 'Swift', label: 'Swift'),
          MultiSelectCard(value: 'Kotlin', label: 'Kotlin')
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}
