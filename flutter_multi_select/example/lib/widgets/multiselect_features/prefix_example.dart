import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select.dart';

class PrefixExample extends StatelessWidget {
  const PrefixExample({
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
            disabledPrefix: const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.do_disturb_alt_sharp,
                size: 14,
              ),
            )),
        items: [
          MultiSelectCard(value: 'Dart', label: 'Dart'),
          MultiSelectCard(value: 'Python', label: 'Python'),
          MultiSelectCard(value: 'JavaScript', label: 'JavaScript'),
          MultiSelectCard(value: 'Java', label: 'Java', enabled: false),
          MultiSelectCard(value: 'C#', label: 'C#'),
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}
