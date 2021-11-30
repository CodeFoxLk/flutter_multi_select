


<img src="https://i.ibb.co/yqNs9Xf/all.png" alt="flutter multi select items" border="0">

------------


**A simple flutter package for creating multi-select widgets.**

- Simple to handle.
- Highly customizable.

All **examples** are available  [in this flutter project](https://github.com/CodeFoxLk/flutter_multi_select/tree/master/flutter_multi_select/example "in this flutter project")

------------

<img src="https://i.ibb.co/W5LvZdn/all2.png" alt="flutter multi select" border="0">

------------

<img src="https://i.ibb.co/S6RYnv2/check-list.gif" width = 250 alt="check-list" border="0">

#### Parameters of multiselect container


| Parameter  |  Description |
| ------------ | ------------ |
|  items |  [MultiSelectCard] List for the multi select container. |
|  maxSelectableCount|  Maximum selectable count. |
|  itemsPadding | MultiSelectCard Item padding|
|  isMaxSelectableWithPerpetualSelects|  if true -> maxSelectingCount = maxSelectingCount + PerpetualSelected items. |
|  itemsDecoration|  Common decorations for all items. |
|  textStyles| Common text styles for all items.|
|  animations| [Row] alignment settings for inside of Multi Select Item card.|
|  alignments| Animation settings like Animations durations and curves.|
|  prefix| Common optional widget to place on the line before in every Multi Select Item.|
|  suffix| Common optional widget to place on the line after in every Multi Select Item.|
|  wrapSettings| Default all items are in a [Wrap]. so these are the settings for [Wrap].|
|  listViewSettings| List view settings for if [showInListView] = true.|
|  showInListView| if -> true, Show all multiselect items in a list view.|
|  controller| A Controller for multi select. Allows to get all selected items, de select all, select all|
|onChange|Call when item is selected.|
|onMaximumSelected|Call when reached to the maximum selectable count. |

------------
#### Parameters of multiselect MultiSelectCard
------------
| Parameter | Description  |
|--|--|
| value | The value for multi select items. it could be String, int or any type. Also, This will be the value or list of values return onChange|
|decorations|Unique decorations for each Items. use only if you are willing to add different decorations for each Items. Otherwise, you can use MultiSelectDecorations in MultiSelectContainer<T>. Since this is common for all items under in MultiSelectContainer<T>|
|textStyles|Unique textStyles for each multi select card. use only if you are willing to add different textStyles for each checklist.|Otherwise, you can use MultiSelectTextStyles in MultiSelectContainer<T>. Since this is common for all items under in MultiSelectContainer<T>
|label|label for multiselect item|
|child|child for multiselect item, you can use any widget as the child|
|clipBehavior|clipping Behavior for item|
|prefix|A Unique optional widget for each item to place on the line before|
|suffix|A Unique optional widget for each item to place on the line after|
|selected|if true - perpetual in the selected position|
|perpetualSelected|if true - perpetual in the selected position|
|splashColor|item Splash color|
|highlightColor|Item highlight color|
|labelGap|Label gap between [prefix] or [suffix]|


#### Minimum Setup

<img src="https://i.ibb.co/HBfwZYH/minimum-setup.gif" alt="flutter multi select minimum-setup" border="0">

complete example code - [flutter multi select minimum setup](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/minimumsetup_example.dart)

    MultiSelectContainer(items: [
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
        ], onChange: (allSelectedItems, selectedItem) {})

### Limited choices

<img src="https://i.ibb.co/CJH09LV/limited-choices.png" alt="limited-choices" width=500 border="0">

complete example code - [flutter multi select limited choices](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/limited_choices_example.dart)

Maximum selectable count ` maxSelectableCount: 5`

    MultiSelectContainer(
            maxSelectableCount: 5,
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
            onMaximumSelected: (allSelectedItems, selectedItem) {
              CustomSnackBar.showInSnackBar('The limit has been reached', context);
            },
            onChange: (allSelectedItems, selectedItem) {})

### Icons
<img src="https://i.ibb.co/P4k0hmz/IMG-20211130-003040.jpg" width=500 alt="Flutter multi select icons" border="0">

complete example code - [flutter multi select prefix](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/prefix_example.dart)

##### Prefix
An optional widget to place on the line before in Multi Select Item.

    MultiSelectContainer(
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
              MultiSelectCard(
                  value: 'JavaScript', label: 'JavaScript'),
              MultiSelectCard(
                  value: 'Java', label: 'Java', enabled: false),
              MultiSelectCard(value: 'C#', label: 'C#'),
            ],
            onChange: (allSelectedItems, selectedItem) {})

##### suffix

complete example code - [flutter multi select suffix](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/suffix_example.dart)

An optional widget to place on the line after in Multi Select Item.

     MultiSelectContainer(
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
              MultiSelectCard(
                  value: 'JavaScript', label: 'JavaScript'),
              MultiSelectCard(
                  value: 'Java', label: 'Java', enabled: false),
              MultiSelectCard(value: 'C#', label: 'C#'),
            ],
            onChange: (allSelectedItems, selectedItem) {})

### Decorations

#### Common decorations
<img src="https://i.ibb.co/0n1DPw0/decoration.gif" alt="common decoration" width=500 border="0">

complete example code - [flutter multi select common decorations](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/common_decoration_example.dart)

Common decorations for all items.
` itemsDecoration: MultiSelectDecorations`

    MultiSelectContainer(
            itemsDecoration: MultiSelectDecorations(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.green.withOpacity(0.1),
                    Colors.yellow.withOpacity(0.1),
                  ]),
                  border: Border.all(color: Colors.green[200]!),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.green,
                    Colors.lightGreen
                  ]),
                  border: Border.all(color: Colors.green[700]!),
                  borderRadius: BorderRadius.circular(5)),
              disabledDecoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.grey[500]!),
                  borderRadius: BorderRadius.circular(10)),
            ),
            items: [
              MultiSelectCard(value: 'Dart', label: 'Dart'),
              MultiSelectCard(value: 'Python', label: 'Python'),
              MultiSelectCard(
                value: 'JavaScript',
                label: 'JavaScript',
              ),
              MultiSelectCard(value: 'Java', label: 'Java'),
              MultiSelectCard(value: 'C#', label: 'C#'),
              MultiSelectCard(value: 'C++', label: 'C++'),
            ],
            onChange: (allSelectedItems, selectedItem) {})

#### Unique decorations for each Items

<img src="https://i.ibb.co/cxJBtkj/IMG-20211130-003820.jpg" width=500 alt="unique decorations multi select" border="0">

complete example code - [flutter multi select decorations](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/unique_decorations_example.dart)

    MultiSelectContainer(
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
              MultiSelectCard(
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
              MultiSelectCard(
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
              MultiSelectCard(
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
              MultiSelectCard(
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
              MultiSelectCard(
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
              MultiSelectCard(
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
              MultiSelectCard(
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
            onChange: (allSelectedItems, selectedItem) {})

### Text Styles

<img src="https://i.ibb.co/f8Kxkfs/IMG-20211130-003841.jpg" width=500 alt="flutter multi select text styles" border="0">


#### Common Text Styles

complete example code - [flutter multi select Text Style ](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/common_text_style_example.dart)


    MultiSelectContainer(
            textStyles: const MultiSelectTextStyles(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue)),
            items: [
              MultiSelectCard(value: 'Dart', label: 'Dart'),
              MultiSelectCard(value: 'Python', label: 'Python'),
              MultiSelectCard(
                  value: 'JavaScript', label: 'JavaScript'),
              MultiSelectCard(value: 'Java', label: 'Java'),
              MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
              MultiSelectCard(value: 'Swift', label: 'Swift'),
              MultiSelectCard(value: 'Kotlin', label: 'Kotlin')
            ],
            onChange: (allSelectedItems, selectedItem) {})

#### Unique Text Style for each items

complete example code - [flutter multi select Text Style ](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/unique_text_styles_example.dart)


    MultiSelectContainer(items: [
          MultiSelectCard(
            value: 'Dart',
            label: 'Dart',
            textStyles: const MultiSelectItemTextStyles(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.purple)),
          ),
          MultiSelectCard(
            value: 'Python',
            label: 'Python',
            textStyles: const MultiSelectItemTextStyles(
                textStyle: TextStyle(color: Colors.lightBlue)),
          ),..........

### Controller

complete example code - [flutter multi select controller](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/controller_example.dart)

     final MultiSelectController<String> _controller = MultiSelectController(
        deSelectPerpetualSelectedItems: true
      );

------------


`deSelectPerpetualSelectedItems: true` Default false. if true -> deselect all selected items with Perpetual selected items

Select all items - `_controller.selectAll()`
Deselect all selected items - `_controller.deselectAll()`
Get all selected items - `_controller.getSelectedItems()`



------------

    MultiSelectContainer(
                controller: _controller,


### Any widget

<img  src="https://i.ibb.co/qCTjLJG/IMG-20211130-003952.jpg" width=450  alt="flutter multi select"  border="0">

complete example code - [flutter multi select any widget](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/multiselect_features/any_widget_example.dart)

    Widget getChild(String imagePath, String title) {
        return SizedBox(
          width: 75,
          height: 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Image.network(
                imagePath,
                fit: BoxFit.contain,
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              )
            ],
          ),
        );
      }


------------



    return MultiSelectContainer(
          itemsPadding: const EdgeInsets.all(5),
          itemsDecoration: MultiSelectDecorations(
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.1)
            ),
            selectedDecoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                 Colors.green,
                 Colors.lightGreen
              ]),  
              
            ),
          ),
          items: [
          MultiSelectCard(
            value: 'Dart',
            child: getChild(
                'https://host/Dart-logo.png',
                'Dart'),
          ),


## Multi select check list view

<img src="https://i.ibb.co/3F77Bbz/Screenshot-2021-11-30-00-52-33-969-com-example-example.jpg" alt="multi select check list" width=300 border="0">

complete example code - [flutter multi select check list](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/screens/multiselect_check_list.dart)

complete example code 2 - [flutter multi select colorful check list ](https://github.com/CodeFoxLk/flutter_multi_select/blob/master/flutter_multi_select/example/lib/widgets/check_list_examples/colorful_checklist.dart)

           MultiSelectCheckList(
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
                    onChange: (allSelectedItems, selectedItem) {
                    },
                    onMaximumSelected: (allSelectedItems, selectedItem) {
                      CustomSnackBar.showInSnackBar('The limit has been reached', context);
                    },
                  )















