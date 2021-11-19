import 'package:flutter/material.dart';
import 'package:flutter_multi_select/src/const/const_values.dart';
import 'package:flutter_multi_select/src/models/multiselect_prefix.dart';
import 'package:flutter_multi_select/src/models/multiselect_suffix.dart';
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
      this.onMaximumSelected,
      this.itemsDecoration = const MultiSelectDecorations(),
      this.textStyles = const MultiSelectTextStyles(),
      this.prefix,
      this.suffix})
      : super(key: key);

  final List<SimpleMultiSelectCard<T>> items;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final int? maxSelectingCount;
  final MultiSelectDecorations itemsDecoration;
  final MultiSelectTextStyles textStyles;
  final MultiSelectPrefix? prefix;
  final MultiSelectSuffix? suffix;

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
        final valuesOfSelected = _getValues();
        //
        if (widget.onMaximumSelected != null) {
          widget.onMaximumSelected!(valuesOfSelected, valuesOfSelected);
        }
        //
        return;
      }
      _selectedItems.add(item);
    }
    final valuesOfSelected = _getValues();
    widget.onChange(valuesOfSelected, valuesOfSelected);
    setState(() {});
  }

  List<T> _getValues() {
    final valuesOfSelected = _selectedItems.map((si) => si.value).toList();
    return valuesOfSelected;
  }

  bool _isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Decoration _getDecoration(SimpleMultiSelectCard<T> item, bool isSelected) {
    final decoration = isSelected
        ? item.decorations.selectedDecoration ??
            widget.itemsDecoration.getSelectedDecoration(context)
        : item.decorations.decoration ??
            widget.itemsDecoration.getDecoration(context);
    return decoration;
  }

  TextStyle _getTextStyle(SimpleMultiSelectCard<T> item, bool isSelected) {
    final textStyle = isSelected
        ? item.textStyles.selectedTextStyle ??
            widget.textStyles.getSelectedTextStyle(context)
        : item.textStyles.textStyle ?? widget.textStyles.getTextStyle(context);
    return textStyle;
  }

  MultiSelectPrefix? _getPrefix(SimpleMultiSelectCard<T> item) {
    final MultiSelectPrefix? prefix = item.prefix ?? widget.prefix;
    return prefix;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? kContainerPadding,
      margin: widget.margin ?? kContainerMargin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kContainerBorderRadius),
          color: _isDarkMode(context)
              ? kDarkThemeContainerBackGroundColor
              : kLightThemeContainerBackGroundColor),
      child: Wrap(
        children: _items.map((item) {
          final bool isSelected = _selectedItems.contains(item);
          final _prefix = _getPrefix(item);
          return AnimatedContainer(
              //
              clipBehavior: item.clipBehavior == null
                  ? (item.child == null ? Clip.hardEdge : item.clipBehavior!)
                  : item.clipBehavior!,
              //
              duration: const Duration(milliseconds: 700),
              //
              decoration: _getDecoration(item, isSelected),
              //
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _prefix == null
                            ? const SizedBox()
                            : AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                child: isSelected
                                    ? SizedBox(
                                        key: UniqueKey(),
                                        child: _prefix.selectedPrefix ??
                                            _prefix.prefix,
                                      )
                                    : SizedBox(
                                        key: UniqueKey(),
                                        child: _prefix.prefix),
                              ),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 400),
                          style: _getTextStyle(item, isSelected),
                          child: item.child ??
                              Text(
                                item.label!,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
