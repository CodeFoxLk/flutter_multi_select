import 'package:flutter/material.dart';
import 'package:flutter_multi_select/src/const/const_values.dart';
import '../../flutter_multi_select.dart';
import '../cards/simple_multiselect_card.dart';

class SimpleMultiSelectContainer<T> extends StatefulWidget {
  const SimpleMultiSelectContainer(
      {Key? key,
      required this.items,
      required this.onChange,
      this.padding,
      this.margin,
      this.maxSelectingCount,
      this.onMaximumSelected})
      : super(key: key);

  final List<SimpleMultiSelectCard<T>> items;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final int? maxSelectingCount;

  final void Function(List<T> selectedItems, List<T>? unselectedItems)?
      onMaximumSelected;
  final void Function(List<T> selectedItems, List<T>? unselectedItems) onChange;

  @override
  _SimpleMultiSelectContainerState<T> createState() =>
      _SimpleMultiSelectContainerState<T>();
}

class _SimpleMultiSelectContainerState<T>
    extends State<SimpleMultiSelectContainer<T>> {
  @override
  void initState() {
    _items = widget.items;
    super.initState();
  }

  late final List<SimpleMultiSelectCard<T>> _items;
  final _selectedItems = <SimpleMultiSelectCard<T>>[];

  void _onSelect(SimpleMultiSelectCard<T> item) {
    //
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
    } else {
      //
      if (widget.maxSelectingCount != null &&
          widget.maxSelectingCount! <= _selectedItems.length) {
        final valuesOfSelected = getValues();
        //
        if (widget.onMaximumSelected != null) {
          widget.onMaximumSelected!(valuesOfSelected, valuesOfSelected);
        }
        //
        return;
      }
      _selectedItems.add(item);
    }
    final valuesOfSelected = getValues();
    widget.onChange(valuesOfSelected, valuesOfSelected);
    setState(() {});
  }

  List<T> getValues() {
    final valuesOfSelected = _selectedItems.map((si) => si.value).toList();
    return valuesOfSelected;
  }

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? kContainerPadding,
      margin: widget.margin ?? kContainerMargin,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(kContainerBorderRadius),
      //     color: isDarkMode(context)
      //         ? kDarkThemeContainerBackGroundColor
      //         : kLightThemeContainerBackGroundColor),
      child: Wrap(
        children: _items.map((item) {
          final bool isSelected = _selectedItems.contains(item);
          return AnimatedContainer(
            clipBehavior: Clip.hardEdge,
              duration: const Duration(milliseconds: 700),
              decoration: isSelected
                  ? item.decorations!.getSelectedDecoration(context)
                  : item.decorations!.getDecoration(context),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    _onSelect(item);
                  },
                  child: Container(
                    padding: item.child == null && item.contentPadding == null
                        ? kCardPadding
                        : item.contentPadding,
                    margin: item.margin ?? kCardMargin,
                    child: item.child ?? Text(item.label!),
                  ),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
