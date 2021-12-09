import 'package:example/widgets/chip_examples/chip_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class OutlinedChipsExample extends StatelessWidget {
  const OutlinedChipsExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _chipData = ChipData.getChips();
    return MultiSelectContainer(
        splashColor: Colors.blue.withOpacity(0.1),
        highlightColor: Colors.blue.withOpacity(0.1),
        prefix: MultiSelectPrefix(
          selectedPrefix: const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.check_sharp,
              color: Colors.blue,
              size: 14,
            ),
          ),
        ),
        textStyles: const MultiSelectTextStyles(
            textStyle: TextStyle(color: Colors.blue),
            selectedTextStyle:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        itemsDecoration: MultiSelectDecorations(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border:
                  Border.all(color: Colors.blue.withOpacity(0.8), width: 0.8),
              borderRadius: BorderRadius.circular(20)),
          selectedDecoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              border: Border.all(color: Colors.blue, width: 1.2),
              borderRadius: BorderRadius.circular(20)),
          disabledDecoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey[500]!),
              borderRadius: BorderRadius.circular(10)),
        ),
        items: List.generate(
          _chipData.length,
          (index) => MultiSelectCard(
              value: _chipData[index].value, label: _chipData[index].label),
        ),
        onChange: (allSelectedItems, selectedItem) {});
  }
}
