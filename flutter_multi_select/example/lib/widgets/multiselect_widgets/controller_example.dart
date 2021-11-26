import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class ControllerExample extends StatelessWidget {
  ControllerExample({
    Key? key,
  }) : super(key: key);

  final MultiSelectController<String> _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // ignore: unused_local_variable
                final list = _controller.selectAll();
              },
              child: const Text('Select All'),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // ignore: unused_local_variable
                final list = _controller.getSelectedItems();
              },
              child: const Text('Get Selected All'),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                _controller.deselectAll();
              },
              child: const Text('Deselect  All'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SimpleMultiSelectContainer(
            controller: _controller,
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
            onChange: (allSelectedItems, selectedItem) {})
      ],
    );
  }
}