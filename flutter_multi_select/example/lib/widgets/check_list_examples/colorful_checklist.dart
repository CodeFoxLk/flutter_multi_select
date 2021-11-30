import 'package:example/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select.dart';

import 'check_list_data_model.dart';

class ColorfulCheckList extends StatelessWidget {
  ColorfulCheckList({Key? key}) : super(key: key);

  final MultiSelectController<String> _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    final _items = CryptoModel.getCrypto();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MultiSelectCheckList<String>(
            textStyles: const MultiSelectTextStyles(
                selectedTextStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            listViewSettings: ListViewSettings(
                separatorBuilder: (context, index) => const Divider(
                      height: 0,
                    )),
            controller: _controller,
            items: List.generate(
                _items.length,
                (index) => CheckListCard<String>(
                    value: _items[index].id,
                    title: Text(_items[index].title),
                    subtitle: Text(_items[index].subTitle),
                    selectedColor: Colors.white,
                    checkColor: _items[index].color,
                    checkBoxBorderSide: BorderSide(color: _items[index].color),
                    decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: _items[index].color.withOpacity(0.1)),
                        selectedDecoration: BoxDecoration(
                            color: _items[index].color.withOpacity(0.8))),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))),
            onChange: (allSelectedItems, selectedItem) {},
            onMaximumSelected: (allSelectedItems, selectedItem) {
              CustomSnackBar.showInSnackBar(
                  'The limit has been reached', context);
            },
          ),
        )
      ],
    );
  }
}
