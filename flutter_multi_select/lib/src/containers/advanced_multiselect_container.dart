import 'package:flutter/material.dart';
import 'package:flutter_multi_select/src/cards/multi_select_card.dart';
import 'package:flutter_multi_select/src/controller/multiselect_controller.dart';
import 'package:flutter_multi_select/src/models/animations.dart';
import 'package:flutter_multi_select/src/models/multiselect_list_settings.dart';
import 'package:flutter_multi_select/src/models/multiselect_wrap_settings.dart';

class AdvanceMultiSelectContainer<T> extends StatefulWidget {
  const AdvanceMultiSelectContainer({
    Key? key,
    required this.items,
    required this.onChange,
    this.maxSelectingCount,
    this.isMaxSelectingCountWithFreezedSelects = false,
    this.onMaximumSelected,
    this.animations = const AdvanceMultiSelectAnimations(),
    this.listViewSettings = const ListViewSettings(),
    this.wrapSettings = const WrapSettings(),
    this.showInListView = true,
    this.controller,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(key: key);

  final List<AdvanceMultiSelectCard<T>> items;
  final int? maxSelectingCount;
  final bool isMaxSelectingCountWithFreezedSelects;
  final AdvanceMultiSelectAnimations animations;
  final ListViewSettings listViewSettings;
  final WrapSettings wrapSettings;
  final MultiSelectController<T>? controller;
  final bool showInListView;
  final void Function(List<T> selectedItems, T selectedItem)? onMaximumSelected;
  final void Function(List<T> selectedItems, T selectedItem) onChange;
  final Widget Function(Widget, Animation<double>) transitionBuilder;
  final Widget Function(Widget?, List<Widget>) layoutBuilder;

  @override
  _AdvanceMultiSelectContainerState createState() =>
      _AdvanceMultiSelectContainerState<T>();
}

class _AdvanceMultiSelectContainerState<T>
    extends State<AdvanceMultiSelectContainer<T>> {
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
  void didUpdateWidget(AdvanceMultiSelectContainer<T> oldWidget) {
    if (widget.controller != null) {
      widget.controller!.deselectAll = oldWidget.controller!.deselectAll;
      widget.controller!.getSelectedItems = oldWidget.controller!.getSelectedItems;
      widget.controller!.selectAll = oldWidget.controller!.selectAll;
    }
    super.didUpdateWidget(oldWidget);
  }

  late final List<AdvanceMultiSelectCard<T>> _items;
  final _selectedItems = <AdvanceMultiSelectCard<T>>[];
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

  List<T> _selectAll() {
    _selectedItems.clear();
  //  _selectedItems.addAll(_items.where((i) => i.enabled).toList());
    setState(() {});
    return _getValues();
  }



  List<T> _getValues() {
    final valuesOfSelected = _selectedItems.map((si) => si.value).toList();
    return valuesOfSelected;
  }

  void _onChange(AdvanceMultiSelectCard<T> item) {
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
        }
      }
    }
    //
    final valuesOfSelected = _getValues();

    widget.onChange(valuesOfSelected, item.value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.showInListView
        ? ListView.separated(
            shrinkWrap: widget.listViewSettings.shrinkWrap,
            scrollDirection: widget.listViewSettings.scrollDirection,
            reverse: widget.listViewSettings.reverse,
            addAutomaticKeepAlives:
                widget.listViewSettings.addAutomaticKeepAlives,
            addRepaintBoundaries: widget.listViewSettings.addRepaintBoundaries,
            dragStartBehavior: widget.listViewSettings.dragStartBehavior,
            keyboardDismissBehavior:
                widget.listViewSettings.keyboardDismissBehavior,
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
              return getItem(_items[index]);
            },
          )
        : Wrap(
            //
            direction: widget.wrapSettings.direction,
            alignment: widget.wrapSettings.alignment,
            spacing: widget.wrapSettings.spacing,
            runAlignment: widget.wrapSettings.runAlignment,
            runSpacing: widget.wrapSettings.runSpacing,
            crossAxisAlignment: widget.wrapSettings.crossAxisAlignment,
            textDirection: widget.wrapSettings.textDirection,
            verticalDirection: widget.wrapSettings.verticalDirection,
            clipBehavior: widget.wrapSettings.clipBehavior,
            children: _items.map((item) {
              return getItem(item);
            }).toList(),
          );
  }

  Widget getItem(AdvanceMultiSelectCard<T> item) {
    final bool isSelected = _selectedItems.contains(item);

    return InkWell(
      onTap: () {
        _onChange(item);
      },
      child: AnimatedSwitcher(
        child: isSelected
            ? item.selectedChild
            : SizedBox(key: ValueKey(item.value), child: item.child),
        duration: const Duration(seconds: 2),
        layoutBuilder: widget.layoutBuilder,
        transitionBuilder: widget.transitionBuilder,
      ),
    );
  }
}
