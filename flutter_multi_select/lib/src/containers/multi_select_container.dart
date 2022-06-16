import 'package:flutter/material.dart';
import '../controller/multiselect_controller.dart';
import '../common/common.dart';
import '../models/decorations.dart';
import '../models/multiselect_text_styles.dart';
import '../const/const_values.dart';
import '../models/alignments.dart';
import '../models/animations.dart';
import '../models/multiselect_list_settings.dart';
import '../models/multiselect_prefix.dart';
import '../models/multiselect_suffix.dart';
import '../models/multiselect_wrap_settings.dart';
import '../cards/multiselect_card.dart';

///Container for multi MultiSelectCard.
class MultiSelectContainer<T> extends StatefulWidget {
  const MultiSelectContainer({
    Key? key,
    required this.items,
    required this.onChange,
    this.maxSelectableCount,
    this.isMaxSelectableWithPerpetualSelects = false,
    this.onMaximumSelected,
    this.itemsPadding,
    this.itemsDecoration = const MultiSelectCardinitialDecoration(),
    this.textStyles = const MultiSelectTextStyles(),
    this.prefix,
    this.suffix,
    this.wrapSettings = const WrapSettings(),
    this.listViewSettings = const ListViewSettings(),
    this.showInListView = false,
    this.animations = const MultiSelectAnimations(),
    this.alignments = const MultiSelectAlignments(),
    this.splashColor,
    this.highlightColor,
    this.controller,
    this.singleSelectedItem = false,
  }) : super(key: key);

  /// [MultiSelectCard] List for the multi select container.
  final List<MultiSelectCard<T>> items;

  /// Maximum selectable count.
  final int? maxSelectableCount;

  /// MultiSelectCard Item padding.
  final EdgeInsetsGeometry? itemsPadding;

  /// if true ->  maxSelectingCount = maxSelectingCount + PerpetualSelected items.
  final bool isMaxSelectableWithPerpetualSelects;

  /// let select only one
  final bool singleSelectedItem;

  /// Common decorations for all items.
  final MultiSelectDecorations itemsDecoration;

  /// Common text styles for all items.
  final MultiSelectTextStyles textStyles;

  /// Animation settings
  final MultiSelectAnimations animations;

  /// [Row] alignment settings for inside of Multi Select Item card.
  final MultiSelectAlignments alignments;

  /// Common optional widget to place on the line before in every Multi Select Item.
  final MultiSelectPrefix? prefix;

  /// Common optional widget to place on the line after in every Multi Select Item.
  final MultiSelectSuffix? suffix;

  /// Default all items are in a [Wrap]. so these are the settings for [Wrap].
  final WrapSettings wrapSettings;

  /// List view settings for if [showInListView] = true.
  final ListViewSettings listViewSettings;

  /// if -> true, Show all multiselect items in a list view.
  final bool showInListView;

  /// A Controller for multi select. Allows to get all selected items, de select all, select all.
  final MultiSelectController<T>? controller;

  /// A Common splash color for all.
  final Color? splashColor;

  /// A Common highlight color for all.
  final Color? highlightColor;

  /// Call when reached to the maximum selectable count.
  final void Function(List<T> selectedItems, T selectedItem)? onMaximumSelected;

  /// Call when item is selected.
  final void Function(List<T> selectedItems, T selectedItem) onChange;

  @override
  _SimpleMultiSelectContainerState createState() =>
      _SimpleMultiSelectContainerState<T>();
}

class _SimpleMultiSelectContainerState<T>
    extends State<MultiSelectContainer<T>> {
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

  late final List<MultiSelectCard<T>> _items;
  final _selectedItems = <MultiSelectCard<T>>[];
  int _perpetualSelectedItemsCount = 0;

  @override
  void didUpdateWidget(MultiSelectContainer<T> oldWidget) {
    _addInitiallySelectedItemsToSelectedList();
    if (widget.controller != null) {
      widget.controller!.deselectAll = oldWidget.controller!.deselectAll;
      widget.controller!.getSelectedItems =
          oldWidget.controller!.getSelectedItems;
      widget.controller!.selectAll = oldWidget.controller!.selectAll;
    }
    super.didUpdateWidget(oldWidget);
  }

  //add initially selected items and find perpetual selected items count
  void _addInitiallySelectedItemsToSelectedList() {
    final initiallySelected = _items.where((item) => item.selected || item.perpetualSelected)
        .toList();
    _selectedItems.addAll(initiallySelected);
    _perpetualSelectedItemsCount =
        _items.where((item) => item.perpetualSelected).length;
    setState(() {});
  }

  // Deselect all selected items excluding Perpetual Selected Items
  // for controller deselect call back
  void _deSelectAll() {
    _selectedItems.removeWhere((item) {
      item.selected = false;
      return widget.controller!.deSelectPerpetualSelectedItems
          ? true
          : !item.perpetualSelected;
    });
    setState(() {});
  }

  //onlyForDeselect, call from onChange
  void _clearSelected() {
    _selectedItems.removeWhere((item) {
      return item.perpetualSelected ? false : true;
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

  void _onChange(MultiSelectCard<T> item) {
    if (!item.perpetualSelected) {
      if (widget.singleSelectedItem) {
        _clearSelected();
        _selectedItems.add(item);
      } else if (_selectedItems.contains(item)) {
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
        }
      }
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

  //Get prefix widget. if a unique prefix for the particular is not available allows to common prefix widget MultiSelectContainer
  MultiSelectPrefix? _getPrefix(MultiSelectCard<T> item) {
    final MultiSelectPrefix? prefix = item.prefix ?? widget.prefix;
    return prefix;
  }

  //Get suffix widget. if a unique suffix for the particular is not available allows to common suffix widget of MultiSelectContainer
  MultiSelectSuffix? _getSuffix(MultiSelectCard<T> item) {
    final MultiSelectSuffix? suffix = item.suffix ?? widget.suffix;
    return suffix;
  }

  // find correct decoration
  Decoration getDecoration(
      MultiSelectItemDecorations itemDecoration,
      MultiSelectDecorations commonItemsDecoration,
      bool isSelected,
      bool enabled,
      BuildContext context) {
    const simpleCardDecoration = MultiSelectCardinitialDecoration();

    final decoration = !enabled
        ? itemDecoration.disabledDecoration ??
            commonItemsDecoration.disabledDecoration ??
            simpleCardDecoration.getDisabledDecoration(context)
        ///////
        : isSelected
            ? itemDecoration.selectedDecoration ??
                commonItemsDecoration.selectedDecoration ??
                simpleCardDecoration.getSelectedDecoration(context)
            ////
            : itemDecoration.decoration ??
                commonItemsDecoration.decoration ??
                simpleCardDecoration.getDecoration(context);
    return decoration;
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
              // wrap in the center, otherwise not affect each single item's margin and padding properties.
              // like different paddings for a single item.
              return Center(
                child: getItem(_items[index]),
              );
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
              var animatedContainer = getItem(item);
              return animatedContainer;
            }).toList(),
          );
  }

  Widget getItem(MultiSelectCard<T> item) {
    final bool isSelected = _selectedItems.contains(item);
    final _prefix = _getPrefix(item);
    final _suffix = _getSuffix(item);
    return AnimatedContainer(
        //
        clipBehavior: item.clipBehavior,
        //
        duration: widget.animations.decorationAimationDuration,
        curve: widget.animations.decorationAnimationCurve,
        //
        decoration: getDecoration(item.decorations, widget.itemsDecoration,
            isSelected, item.enabled, context),
        //
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: item.splashColor ?? widget.splashColor,
            highlightColor: item.highlightColor ?? widget.highlightColor,
            onTap: item.enabled == false
                ? null
                : () {
                    _onChange(item);
                  },
            child: Container(
              alignment: item.alignment,
              padding: (item.child == null &&
                      item.contentPadding == null &&
                      widget.itemsPadding == null)
                  ? kCardPadding
                  : item.contentPadding ?? widget.itemsPadding,
              margin: item.margin ?? kCardMargin,
              child: Row(
                mainAxisSize: widget.alignments.mainAxisSize,
                mainAxisAlignment: widget.alignments.mainAxisAlignment,
                crossAxisAlignment: widget.alignments.crossAxisAlignment,
                children: [
                  _prefix == null
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(right: item.labelGap ?? 4),
                          child: !item.enabled
                              ? SizedBox(
                                  key: ValueKey(item.value),
                                  child: _prefix.disabledPrefix ??
                                      _prefix.enabledPrefix,
                                )
                              : AnimatedSwitcher(
                                  duration:
                                      widget.animations.prefixAimationDuration,
                                  switchInCurve:
                                      widget.animations.prefixAnimationCurve,
                                  switchOutCurve:
                                      widget.animations.prefixAnimationCurve,
                                  layoutBuilder: (Widget? currentChild,
                                      List<Widget> previousChildren) {
                                    return currentChild!;
                                  },
                                  child: isSelected
                                      ? SizedBox(
                                          key: ValueKey(item.value),
                                          child: _prefix.selectedPrefix ??
                                              _prefix.enabledPrefix,
                                        )
                                      : SizedBox(child: _prefix.enabledPrefix),
                                ),
                        ),
                  AnimatedDefaultTextStyle(
                    duration: widget.animations.labelAimationDuration,
                    curve: widget.animations.labeAnimationlCurve,
                    style: getTextStyle(item.textStyles, widget.textStyles,
                        isSelected, item.enabled, context),
                    child: item.child ??
                        Text(
                          item.label!,
                        ),
                  ),
                  _suffix == null
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(left: item.labelGap ?? 4),
                          child: !item.enabled
                              ? SizedBox(
                                  key: ValueKey(item.value),
                                  child: _suffix.disabledSuffix ??
                                      _suffix.enabledSuffix,
                                )
                              : AnimatedSwitcher(
                                  duration:
                                      widget.animations.suffixAimationDuration,
                                  switchInCurve:
                                      widget.animations.suffixAnimationCurve,
                                  switchOutCurve:
                                      widget.animations.suffixAnimationCurve,
                                  layoutBuilder: (Widget? currentChild,
                                      List<Widget> previousChildren) {
                                    return currentChild!;
                                  },
                                  child: isSelected
                                      ? SizedBox(
                                          key: ValueKey(item.value),
                                          child: _suffix.selectedSuffix ??
                                              _suffix.enabledSuffix,
                                        )
                                      : SizedBox(child: _suffix.enabledSuffix),
                                ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
