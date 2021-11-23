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
import '../cards/simple_multiselect_card.dart';

class SimpleMultiSelectContainer<T> extends StatefulWidget {
  const SimpleMultiSelectContainer({
    Key? key,
    required this.items,
    required this.onChange,
    this.padding,
    this.margin,
    this.maxSelectingCount,
    this.isMaxSelectingCountWithFreezedSelects = false,
    this.onMaximumSelected,
    this.itemsDecoration = const MultiSelectDecorations(),
    this.textStyles = const MultiSelectTextStyles(),
    this.prefix,
    this.suffix,
    this.wrapSettings = const WrapSettings(),
    this.listViewSettings = const ListViewSettings(),
    this.showInListView = false,
    this.animations = const MultiSelectSimpleAnimations(),
    this.alignments = const MultiSelectSimpleAlignments(),
    this.onDisabledTap,
    this.controller,
  }) : super(key: key);

  final List<SimpleMultiSelectCard<T>> items;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final int? maxSelectingCount;
  final bool isMaxSelectingCountWithFreezedSelects;
  final MultiSelectDecorations itemsDecoration;
  final MultiSelectTextStyles textStyles;
  final MultiSelectSimpleAnimations animations;
  final MultiSelectSimpleAlignments alignments;
  final MultiSelectPrefix? prefix;
  final MultiSelectSuffix? suffix;
  final WrapSettings wrapSettings;
  final ListViewSettings listViewSettings;
  final bool showInListView;
  final MultiSelectController<T>? controller;

  final void Function(List<T> selectedItems, T selectedItem)?
      onMaximumSelected;
  final void Function(
      List<T> selectedItems, T selectedItem) onChange;
  final void Function(SimpleMultiSelectCard<T> selectedItem)? onDisabledTap;

  @override
  _SimpleMultiSelectContainerState createState() =>
      _SimpleMultiSelectContainerState<T>();
}

class _SimpleMultiSelectContainerState<T>
    extends State<SimpleMultiSelectContainer<T>> {
  @override
  void initState() {
    _items = widget.items;
    addInitiallySelectedItemsToSelectedList();
    super.initState();
  }

  late final List<SimpleMultiSelectCard<T>> _items;
  final _selectedItems = <SimpleMultiSelectCard<T>>[];
  int _freezeSelectedItemsCount = 0;

  @override
  void didUpdateWidget(SimpleMultiSelectContainer<T> oldWidget) {
    if (widget.controller != null) {
      widget.controller!.unSelectAll = oldWidget.controller!.unSelectAll;
      widget.controller!.getSelectedItems =
          oldWidget.controller!.getSelectedItems;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _unSelectAll() {
    _selectedItems.removeWhere((item) {
      item.selected = false;

      return widget.controller!.unSelectFreezedItems
          ? true
          : !item.freezeInSelected;
    });
    setState(() {});
  }

  List<T> _getSelectedItems() {
    return _getValues();
  }

  void addInitiallySelectedItemsToSelectedList() {
    final initiallySelected =
        _items.where((item) => item.selected || item.freezeInSelected).toList();
    _selectedItems.addAll(initiallySelected);
    _freezeSelectedItemsCount =
        _items.where((item) => item.freezeInSelected).length;
  }

  void _onChange(SimpleMultiSelectCard<T> item) {
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

  List<T> _getValues() {
    final valuesOfSelected = _selectedItems.map((si) => si.value).toList();
    return valuesOfSelected;
  }

  bool _isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  MultiSelectPrefix? _getPrefix(SimpleMultiSelectCard<T> item) {
    final MultiSelectPrefix? prefix = item.prefix ?? widget.prefix;
    return prefix;
  }

  MultiSelectSuffix? _getSuffix(SimpleMultiSelectCard<T> item) {
    final MultiSelectSuffix? suffix = item.suffix ?? widget.suffix;
    return suffix;
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
      child: widget.showInListView
          ? ListView.separated(
              shrinkWrap: widget.listViewSettings.shrinkWrap,
              scrollDirection: widget.listViewSettings.scrollDirection,
              reverse: widget.listViewSettings.reverse,
              addAutomaticKeepAlives:
                  widget.listViewSettings.addAutomaticKeepAlives,
              addRepaintBoundaries:
                  widget.listViewSettings.addRepaintBoundaries,
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
                var animatedContainer = getItem(item);
                return animatedContainer;
              }).toList(),
            ),
    );
  }

  Widget getItem(SimpleMultiSelectCard<T> item) {
    final bool isSelected = _selectedItems.contains(item);
    final _prefix = _getPrefix(item);
    final _suffix = _getSuffix(item);
    return AnimatedContainer(
        //
        clipBehavior: item.clipBehavior == null
            ? (item.child == null ? Clip.hardEdge : item.clipBehavior!)
            : item.clipBehavior!,
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
            onTap: item.enabled == false
                ? widget.onDisabledTap == null
                    ? null
                    : () {
                        widget.onDisabledTap!(item);
                      }
                : () {
                    _onChange(item);
                  },
            child: Container(
              alignment: item.alignment,
              padding: item.child == null && item.contentPadding == null
                  ? kCardPadding
                  : item.contentPadding,
              margin: item.margin ?? kCardMargin,
              child: Row(
                mainAxisSize: widget.alignments.mainAxisSize,
                mainAxisAlignment: widget.alignments.mainAxisAlignment,
                crossAxisAlignment: widget.alignments.crossAxisAlignment,
                children: [
                  _prefix == null
                      ? const SizedBox()
                      : !item.enabled
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
                      : !item.enabled
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
                ],
              ),
            ),
          ),
        ));
  }
}
