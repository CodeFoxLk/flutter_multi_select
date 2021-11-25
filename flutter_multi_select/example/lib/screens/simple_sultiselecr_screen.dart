import 'package:example/themedata/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';


class SimpleMultiSelectSceen extends StatelessWidget {
   SimpleMultiSelectSceen({Key? key}) : super(key: key);

  
  void _showInSnackBar(String value, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MultiSelectController _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    var divider = const Divider(
      height: 40,
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Simple Examples'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Minimum Setup',
                style: titleTS,
              ),
              const Text('Select Favorite programming languages'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(items: [
                SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
                SimpleMultiSelectCard(value: 'Python', label: 'Python'),
                SimpleMultiSelectCard(value: 'JavaScript', label: 'JavaScript'),
                SimpleMultiSelectCard(value: 'Java', label: 'Java'),
                SimpleMultiSelectCard(value: 'C#', label: 'C#'),
                SimpleMultiSelectCard(value: 'C++', label: 'C++'),
                SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
                SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
                SimpleMultiSelectCard(value: 'PHP', label: 'PHP'),
                SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
              ], onChange: (allSelectedItems, selectedItem) {}),
              divider,
              const Text(
                'Limited choices',
                style: titleTS,
              ),
              const Text('Select only 5 programming languages'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(
                  maxSelectingCount: 5,
                  items: [
                    SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
                    SimpleMultiSelectCard(value: 'Python', label: 'Python'),
                    SimpleMultiSelectCard(
                        value: 'JavaScript', label: 'JavaScript'),
                    SimpleMultiSelectCard(value: 'Java', label: 'Java'),
                    SimpleMultiSelectCard(value: 'C#', label: 'C#'),
                    SimpleMultiSelectCard(value: 'C++', label: 'C++'),
                    SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
                    SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
                    SimpleMultiSelectCard(value: 'PHP', label: 'PHP'),
                    SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
                  ],
                  onMaximumSelected: (allSelectedItems, selectedItem) {
                    _showInSnackBar('The limit has been reached', context);
                  },
                  onChange: (allSelectedItems, selectedItem) {}),
              divider,
              const Text(
                'Icons',
                style: titleTS,
              ),
              const Text('Prefix'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(
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
                    SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
                    SimpleMultiSelectCard(value: 'Python', label: 'Python'),
                    SimpleMultiSelectCard(
                        value: 'JavaScript', label: 'JavaScript'),
                    SimpleMultiSelectCard(
                        value: 'Java', label: 'Java', enabled: false),
                    SimpleMultiSelectCard(value: 'C#', label: 'C#'),
                  ],
                  onChange: (allSelectedItems, selectedItem) {}),
              const Divider(),
              const Text('Suffix'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(
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
                  onChange: (allSelectedItems, selectedItem) {}),
              divider,
              const Text(
                'Decorations',
                style: titleTS,
              ),
              const Text('Common decorations'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(
                  prefix: MultiSelectPrefix(
                    selectedPrefix: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                  itemsDecoration: MultiSelectDecorations(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        border: Border.all(color: Colors.green[200]!),
                        borderRadius: BorderRadius.circular(20)),
                    selectedDecoration: BoxDecoration(
                        color: Colors.green[400],
                        border: Border.all(color: Colors.green[700]!),
                        borderRadius: BorderRadius.circular(5)),
                    disabledDecoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey[500]!),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  items: [
                    SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
                    SimpleMultiSelectCard(value: 'Python', label: 'Python'),
                    SimpleMultiSelectCard(
                      value: 'JavaScript',
                      label: 'JavaScript',
                    ),
                    SimpleMultiSelectCard(value: 'Java', label: 'Java'),
                    SimpleMultiSelectCard(value: 'C#', label: 'C#'),
                    SimpleMultiSelectCard(value: 'C++', label: 'C++'),
                  ],
                  onChange: (allSelectedItems, selectedItem) {}),
              const Divider(),
              const Text('Unique decorations for each Items'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(
                  prefix: MultiSelectPrefix(
                    selectedPrefix: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                  items: [
                    SimpleMultiSelectCard(
                      value: 'Dart',
                      label: 'Dart',
                      decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        selectedDecoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SimpleMultiSelectCard(
                      value: 'Python',
                      label: 'Python',
                      decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        selectedDecoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SimpleMultiSelectCard(
                      value: 'JavaScript',
                      label: 'JavaScript',
                      decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        selectedDecoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SimpleMultiSelectCard(
                      value: 'Java',
                      label: 'Java',
                      decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        selectedDecoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SimpleMultiSelectCard(
                      value: 'C#',
                      label: 'C#',
                      decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        selectedDecoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SimpleMultiSelectCard(
                      value: 'C++',
                      label: 'C++',
                      decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        selectedDecoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SimpleMultiSelectCard(
                      value: 'Kotlin',
                      label: 'Kotlin',
                      decorations: MultiSelectItemDecorations(
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        selectedDecoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ],
                  onChange: (allSelectedItems, selectedItem) {}),
              divider,
              const Text(
                'Text Styles',
                style: titleTS,
              ),
              const Text('Common Text Styles'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(
                  textStyles: const MultiSelectTextStyles(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue)),
                  items: [
                    SimpleMultiSelectCard(value: 'Dart', label: 'Dart'),
                    SimpleMultiSelectCard(value: 'Python', label: 'Python'),
                    SimpleMultiSelectCard(
                        value: 'JavaScript', label: 'JavaScript'),
                    SimpleMultiSelectCard(value: 'Java', label: 'Java'),
                    SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
                    SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
                    SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
                  ],
                  onChange: (allSelectedItems, selectedItem) {}),
              const Divider(),
              const Text('Unique Text Style for each items'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(items: [
                SimpleMultiSelectCard(
                  value: 'Dart',
                  label: 'Dart',
                  textStyles: const MultiSelectItemTextStyles(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple)),
                ),
                SimpleMultiSelectCard(
                  value: 'Python',
                  label: 'Python',
                  textStyles: const MultiSelectItemTextStyles(
                      textStyle: TextStyle(color: Colors.lightBlue)),
                ),
                SimpleMultiSelectCard(
                  value: 'JavaScript',
                  label: 'JavaScript',
                  textStyles: const MultiSelectItemTextStyles(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                ),
                SimpleMultiSelectCard(
                  value: 'Java',
                  label: 'Java',
                  textStyles: const MultiSelectItemTextStyles(
                      textStyle: TextStyle(color: Colors.amber)),
                ),
                SimpleMultiSelectCard(
                  value: 'Go Lang',
                  label: 'Go Lang',
                  textStyles: const MultiSelectItemTextStyles(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange)),
                ),
                SimpleMultiSelectCard(
                  value: 'Swift',
                  label: 'Swift',
                  textStyles: const MultiSelectItemTextStyles(
                      textStyle: TextStyle(color: Colors.red)),
                ),
              ], onChange: (allSelectedItems, selectedItem) {}),
              divider,
              const Text(
                'Status',
                style: titleTS,
              ),
              const Text('Enabled / Disabled / Selected / Freezed in Selected'),
              const SizedBox(
                height: 10,
              ),
              SimpleMultiSelectContainer(
                  items: [
                    SimpleMultiSelectCard(
                        value: 'Dart', label: 'Dart', selected: true),
                    SimpleMultiSelectCard(
                        value: 'Python', label: 'Python', enabled: false),
                    SimpleMultiSelectCard(
                        value: 'JavaScript',
                        label: 'JavaScript',
                        freezeInSelected: true),
                    SimpleMultiSelectCard(value: 'Java', label: 'Java'),
                    SimpleMultiSelectCard(value: 'C#', label: 'C#'),
                    SimpleMultiSelectCard(value: 'C++', label: 'C++'),
                    SimpleMultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
                    SimpleMultiSelectCard(value: 'Swift', label: 'Swift'),
                    SimpleMultiSelectCard(value: 'PHP', label: 'PHP'),
                    SimpleMultiSelectCard(value: 'Kotlin', label: 'Kotlin')
                  ],
                 onChange: (allSelectedItems, selectedItem) {}),
              divider,
              const Text(
                'Controller',
                style: titleTS,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                       _controller.selectAll();
                    },
                    child: const Text('Select All'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
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
                  onChange: (allSelectedItems, selectedItem) {}),
            ],
          ),
        ),
      ),
    );
  }
}
