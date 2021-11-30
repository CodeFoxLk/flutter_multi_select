import 'package:flutter/material.dart';
import '../common/common.dart';
import '../const/const_values.dart';
import '../controller/multiselect_controller.dart';
import '../models/multiselect_list_settings.dart';
import '../models/animations.dart';
import '../models/decorations.dart';
import '../models/multiselect_text_styles.dart';
import '../cards/check_list_card.dart';

///Container for multi select check list cards.
class MultiSelectCheckList<T> extends StatefulWidget {
  const MultiSelectCheckList({
    Key? key,
    required this.items,
    this.itemPadding = kCheckListPadding,
    this.maxSelectableCount,
    this.isMaxSelectableWithPerpetualSelects = false,
    this.itemsDecoration = const CheckListViewinitialDecoration(),
    this.textStyles = const CheckListViewInitialTS(),
    this.animations = const MultiSelectAnimations(),
    this.listViewSettings = const ListViewSettings(),
    this.onMaximumSelected,
    required this.onChange,
    this.chechboxScaleFactor = 1,
    this.controller,
  }) : super(key: key);

  /// [CheckListCard] List for check list container.
  final List<CheckListCard<T>> items;

  /// [CheckListCard] padding.
  final EdgeInsetsGeometry itemPadding;

  /// Maximum selectable count.
  final int? maxSelectableCount;

  /// if true ->  maxSelectingCount = maxSelectingCount + PerpetualSelected items.
  final bool isMaxSelectableWithPerpetualSelects;

  /// Common decorations for all items.
  final MultiSelectDecorations itemsDecoration;

  /// Common text styles for all items.
  final MultiSelectTextStyles textStyles;

  /// All the settings for the list view.
  final ListViewSettings listViewSettings;

  /// Animation settings.
  final MultiSelectAnimations animations;

  /// Checkbox scale changing factor.
  final double chechboxScaleFactor;

  ///  A Controller for multi select. Allows to get all selected items, de select all, select all.
  final MultiSelectController<T>? controller;

  /// Call when reached to the maximum selectable count.
  final void Function(List<T> selectedItems, T selectedItem)? onMaximumSelected;

  /// Call when item is selected.
  final void Function(List<T> selectedItems, T selectedItem) onChange;

  @override
  _MultiSelectCheckListState<T> createState() => _MultiSelectCheckListState();
}

class _MultiSelectCheckListState<T> extends State<MultiSelectCheckList<T>> {
  @override
  void initState() {
    _items = widget.items;
    _addInitiallySelectedItemsToSelectedList();
    if (widget.controller != null) {
      widget.controller!.deselectAll = _deSelectAll;
      widget.controller!.getSelectedItems = _getValues;
      widget.controller!.selectAll = _selectAll;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(MultiSelectCheckList<T> oldWidget) {
    if (widget.controller != null) {
      widget.controller!.deselectAll = oldWidget.controller!.deselectAll;
      widget.controller!.getSelectedItems =
          oldWidget.controller!.getSelectedItems;
      widget.controller!.selectAll = oldWidget.controller!.selectAll;
    }
    super.didUpdateWidget(oldWidget);
  }

  late final List<CheckListCard<T>> _items;
  final _selectedItems = <CheckListCard<T>>[];
  int _perpetualSelectedItemsCount = 0;

  // add initially selected items and find perpetual selected items count
  void _addInitiallySelectedItemsToSelectedList() {
    final initiallySelected = _items
        .where((item) => item.selected || item.perpetualSelected)
        .toList();
    _selectedItems.addAll(initiallySelected);
    _perpetualSelectedItemsCount =
        _items.where((item) => item.perpetualSelected).length;
    setState(() {});
  }

  // Deselect all selected items excluding Perpetual Selected Items
  void _deSelectAll() {
    _selectedItems.removeWhere((item) {
      item.selected = false;

      return widget.controller!.deSelectPerpetualSelectedItems
          ? true
          : !item.perpetualSelected;
    });
    setState(() {});
  }

  //Select items excluding disabled Selected Items
  List<T> _selectAll() {
    _selectedItems.clear();
    _selectedItems.addAll(_items.where((i) => i.enabled).toList());
    setState(() {});
    return _getValues();
  }

  void _onChange(CheckListCard<T> item) {
    if (!item.perpetualSelected) {
      if (_selectedItems.contains(item)) {
        // if already selected - deselect item
        _selectedItems.remove(item);
        item.selected = false; // change item status
      } else {
        //
        int? maxSelectableCount = widget.maxSelectableCount;

        if (widget.isMaxSelectableWithPerpetualSelects &&
            _perpetualSelectedItemsCount > 0) {
          maxSelectableCount = (maxSelectableCount ?? 0) +
              _perpetualSelectedItemsCount; // maxSelectingCount = maxSelectingCount + PerpetualSelected items
        }
        //
        if (maxSelectableCount != null &&
            maxSelectableCount <= _selectedItems.length) {
          final valuesOfSelected = _getValues();
          //
          if (widget.onMaximumSelected != null) {
            widget.onMaximumSelected!(valuesOfSelected, item.value);
          }
          //
        } else {
          _selectedItems.add(item);
          item.selected = true;
        }
      }
    } else {
      item.selected = true;
    }
    //
    final valuesOfSelected = _getValues();
    widget.onChange(valuesOfSelected, item.value);
    setState(() {});
  }

  //get values of all selected items
  List<T> _getValues() {
    final valuesOfSelected = _selectedItems.map((si) => si.value).toList();
    return valuesOfSelected;
  }

  // find correct decoration
  Decoration getDecoration(
      MultiSelectItemDecorations itemDecoration,
      MultiSelectDecorations commonItemsDecoration,
      bool isSelected,
      bool enabled,
      BuildContext context) {
    const checkListViewinitialDecoration = CheckListViewinitialDecoration();

    final decoration = !enabled
        ? itemDecoration.disabledDecoration ??
            commonItemsDecoration.disabledDecoration ??
            checkListViewinitialDecoration.getDisabledDecoration(context)
        ///////
        : isSelected
            ? itemDecoration.selectedDecoration ??
                commonItemsDecoration.selectedDecoration ??
                checkListViewinitialDecoration.getSelectedDecoration(context)
            ////
            : itemDecoration.decoration ??
                commonItemsDecoration.decoration ??
                checkListViewinitialDecoration.getDecoration(context);
    return decoration;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: widget.listViewSettings.shrinkWrap,
      scrollDirection: widget.listViewSettings.scrollDirection,
      reverse: widget.listViewSettings.reverse,
      addAutomaticKeepAlives: widget.listViewSettings.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.listViewSettings.addRepaintBoundaries,
      dragStartBehavior: widget.listViewSettings.dragStartBehavior,
      keyboardDismissBehavior: widget.listViewSettings.keyboardDismissBehavior,
      clipBehavior: widget.listViewSettings.clipBehavior,
      controller: widget.listViewSettings.controller,
      primary: widget.listViewSettings.primary,
      physics: widget.listViewSettings.physics,
      padding: widget.listViewSettings.padding,
      cacheExtent: widget.listViewSettings.cacheExtent,
      restorationId: widget.listViewSettings.restorationId,
      itemCount: _items.length,
      separatorBuilder: widget.listViewSettings.separatorBuilder ??
          (BuildContext context, int index) {
            return const SizedBox(
              height: 5,
            );
          },
      itemBuilder: (BuildContext context, int index) {
        final CheckListCard<T> _item = _items[index];
        final bool isSelected = _selectedItems.contains(_item);
        //
        var checkbox = Transform.scale(
          scale: 1 * widget.chechboxScaleFactor,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: _item.selectedColor,
              checkColor: _item.checkColor,
              fillColor: !_item.enabled
                  ? MaterialStateProperty.all(_item.disabledColor)
                  : MaterialStateProperty.all(_item.enabledColor),
              shape: _item.shape,
              value: isSelected,
              side: _item.checkBoxBorderSide,
              onChanged: !_item.enabled ? null : (v) {},
            ),
          ),
        );
        return AnimatedContainer(
          //
          duration: widget.animations.decorationAimationDuration,
          curve: widget.animations.decorationAnimationCurve,
          //
          decoration: getDecoration(_item.decorations, widget.itemsDecoration,
              isSelected, _item.enabled, context),
          //
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              hoverColor: _item.hoverColor,
              onTap: !_item.enabled
                  ? null
                  : () {
                      _onChange(_item);
                    },
              child: Padding(
                padding: widget.itemPadding,
                child: Row(
                  children: [
                    Visibility(visible: _item.leadingCheckBox, child: checkbox),
                    Visibility(
                      visible: _item.leadingCheckBox,
                      child: SizedBox(
                        width: _item.checkBoxGap,
                      ),
                    ),
                    DefaultTextStyle(
                      style: getTextStyle(_item.textStyles, widget.textStyles,
                          isSelected, _item.enabled, context),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _item.title ?? const SizedBox(),
                            DefaultTextStyle(
                              style: getTextStyle(
                                      _item.textStyles,
                                      widget.textStyles,
                                      isSelected,
                                      _item.enabled,
                                      context)
                                  .copyWith(fontSize: 12),
                              child: _item.subtitle ?? const SizedBox(),
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !_item.leadingCheckBox,
                      child: SizedBox(
                        width: _item.checkBoxGap,
                      ),
                    ),
                    Visibility(
                        visible: !_item.leadingCheckBox, child: checkbox),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
