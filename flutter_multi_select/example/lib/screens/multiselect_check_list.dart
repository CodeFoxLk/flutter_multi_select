import 'package:example/themedata/textstyles.dart';
import 'package:example/widgets/check_list_examples/check_list_data_model.dart';
import 'package:example/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class MultiSelectCheckListScreen extends StatelessWidget {
  MultiSelectCheckListScreen({Key? key}) : super(key: key);

  final MultiSelectController<String> _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    final _items = CryptoModel.getCrypto();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Multi Select Check List '),
          actions: [
            ElevatedButton(
                onPressed: () {
                  _controller.selectAll();
                },
                child: const Text('Select All'))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select 5 Important Cryptocurrencies',
                style: titleTS,
              ),
            ),
            Expanded(
              child: MultiSelectCheckList(
                maxSelectableCount: 5,
                textStyles: const MultiSelectTextStyles(
                    selectedTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                itemsDecoration: MultiSelectDecorations(
                    selectedDecoration:
                        BoxDecoration(color: Colors.indigo.withOpacity(0.8))),
                listViewSettings: ListViewSettings(
                    separatorBuilder: (context, index) => const Divider(
                          height: 0,
                        )),
                controller: _controller,
                items: List.generate(
                    _items.length,
                    (index) => CheckListCard(
                        value: _items[index].id,
                        title: Text(_items[index].title),
                        subtitle: Text(_items[index].subTitle),
                        selectedColor: Colors.white,
                        checkColor: Colors.indigo,
                        selected: index == 3,
                        enabled: !(index == 5),
                        checkBoxBorderSide:
                            const BorderSide(color: Colors.blue),
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
        ));
  }
}
