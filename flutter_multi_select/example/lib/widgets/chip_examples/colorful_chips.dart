import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

import 'chip_data_model.dart';

class ColorFulChipExample extends StatelessWidget {
  const ColorFulChipExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _chipData = ChipData.getChips();
    return MultiSelectContainer(
        wrapSettings: const WrapSettings(runSpacing: 10),
        items: List.generate(_chipData.length, (index) {
          final ChipData data = _chipData[index];
          return MultiSelectCard(
              // clipBehavior: Clip.none,
              value: data.value,
              label: data.label,
              splashColor: data.chipColor.withOpacity(0.1),
              highlightColor: data.chipColor.withOpacity(0.1),
              decorations: MultiSelectItemDecorations(
                  decoration: BoxDecoration(
                      color: data.chipColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  selectedDecoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: data.chipColor.withOpacity(0.2),
                            blurRadius: 2,
                            spreadRadius: 4)
                      ],
                      color: data.chipColor,
                      borderRadius: BorderRadius.circular(20)),
                  disabledDecoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.grey[500]!),
                      borderRadius: BorderRadius.circular(10))),
              textStyles: MultiSelectItemTextStyles(
                textStyle: TextStyle(
                    color: data.chipColor, fontWeight: FontWeight.bold),
                selectedTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ));
        }),
        onChange: (allSelectedItems, selectedItem) {});
  }
}
