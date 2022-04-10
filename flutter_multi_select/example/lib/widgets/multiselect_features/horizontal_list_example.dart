import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class HorizontalChipListExample extends StatelessWidget {
  const HorizontalChipListExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: MultiSelectContainer(
          showInListView: true,
          listViewSettings: ListViewSettings(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(
                    width: 10,
                  )),
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
          onChange: (allSelectedItems, selectedItem) {}),
    );
  }
}
