import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class SuffixExample extends StatelessWidget {
  const SuffixExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleMultiSelectContainer(
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
          SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
          SimpleMultiSelectCard(value: 'Python', label: 'Python'),
          SimpleMultiSelectCard(
              value: 'JavaScript', label: 'JavaScript'),
          SimpleMultiSelectCard(
              value: 'Java', label: 'Java', enabled: false),
          SimpleMultiSelectCard(value: 'C#', label: 'C#'),
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}