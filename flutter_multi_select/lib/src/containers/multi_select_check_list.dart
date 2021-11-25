import 'package:flutter/material.dart';
import '../common/common.dart';
import '../const/const_values.dart';
import '../controller/multiselect_controller.dart';
import '../models/multiselect_list_settings.dart';
import '../models/animations.dart';
import '../models/decorations.dart';
import '../models/multiselect_text_styles.dart';
import '../cards/check_list_card.dart';

class MultiSelectCheckList<T> extends StatefulWidget {
  const MultiSelectCheckList({
    Key? key,
    required this.items,
    this.padding = kCheckListPadding,
    this.maxSelectingCount,
    this.isMaxSelectingCountWithFreezedSelects = false,
    this.itemsDecoration = const CheckListViewinitialDecoration(),
    this.textStyles = const CheckListViewInitialTS(),
    this.animations = const MultiSelectSimpleAnimations(),
    this.listViewSettings = const ListViewSettings(),
    this.onMaximumSelected,
    required this.onChange,
    this.checkBoxBorderSide,
    this.chechboxScaleFactor = 1,
    this.controller,
  }) : super(key: key);
  final List<CheckListCard<T>> items;
  final EdgeInsetsGeometry padding;
  final int? maxSelectingCount;
  final bool isMaxSelectingCountWithFreezedSelects;
  final MultiSelectDecorations itemsDecoration;
  final MultiSelectTextStyles textStyles;
  final ListViewSettings listViewSettings;
  final MultiSelectSimpleAnimations animations;
  final BorderSide? checkBoxBorderSide;
  final double chechboxScaleFactor;
  final MultiSelectController<T>? controller;

  final void Function(List<T> selectedItems, T selectedItem)? onMaximumSelected;
  final void Function(List<T> selectedItems, T selectedItem) onChange;

  @override
  _MultiSelectCheckListState<T> createState() => _MultiSelectCheckListState();
}

class _MultiSelectCheckListState<T> extends State<MultiSelectCheckList<T>> {
  @override
  void initState() {
    _items = widget.items;
    addInitiallySelectedItemsToSelectedList();
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
      widget.controller!.getSelectedItems = oldWidget.controller!.getSelectedItems;
      widget.controller!.selectAll = oldWidget.controller!.selectAll;
    }
    super.didUpdateWidget(oldWidget);
  }

  late final List<CheckListCard<T>> _items;
  final _selectedItems = <CheckListCard<T>>[];
  int _freezeSelectedItemsCount = 0;

  void addInitiallySelectedItemsToSelectedList() {
    final initiallySelected =
        _items.where((item) => item.selected || item.freezeInSelected).toList();
    _selectedItems.addAll(initiallySelected);
    _freezeSelectedItemsCount =
        _items.where((item) => item.freezeInSelected).length;
  }

  void _deSelectAll() {
    _selectedItems.removeWhere((item) {
      item.selected = false;

      return widget.controller!.deselectFreezedItems
          ? true
          : !item.freezeInSelected;
    });
    setState(() {});
  }

  void _selectAll(){
    _selectedItems.addAll(_items);
    setState(() {});
  }

  void _onChange(CheckListCard<T> item) {
    if (!item.freezeInSelected) {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
        item.selected = false;
      } else {
        //
        int? maxSelectingCount = widget.maxSelectingCount;

        if (widget.isMaxSelectingCountWithFreezedSelects &&
            _freezeSelectedItemsCount > 0) {
          maxSelectingCount =
              (maxSelectingCount ?? 0) + _freezeSelectedItemsCount;
        }
        //
        if (maxSelectingCount != null &&
            maxSelectingCount <= _selectedItems.length) {
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

  List<T> _getValues() {
    final valuesOfSelected = _selectedItems.map((si) => si.value).toList();
    return valuesOfSelected;
  }

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
              side: widget.checkBoxBorderSide,
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
                padding: widget.padding,
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
