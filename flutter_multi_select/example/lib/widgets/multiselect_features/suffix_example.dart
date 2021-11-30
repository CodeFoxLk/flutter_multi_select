import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select.dart';

class SuffixExample extends StatelessWidget {
  const SuffixExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
        suffix: MultiSelectSuffix(
            selectedSuffix: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 14,
              ),
            ),
            disabledSuffix: const Padding(
              padding: EdgeInsets.only(left: 5),
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
