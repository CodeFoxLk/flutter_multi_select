import 'package:flutter/material.dart';
import 'package:flutter_multi_select/src/cards/multi_select_card.dart';
import 'package:flutter_multi_select/src/controller/multiselect_controller.dart';
import 'package:flutter_multi_select/src/models/animations.dart';
import 'package:flutter_multi_select/src/models/decorations.dart';
import 'package:flutter_multi_select/src/models/multiselect_list_settings.dart';
import 'package:flutter_multi_select/src/models/multiselect_text_styles.dart';

class AdvanceMultiSelectContainer<T> extends StatefulWidget {
  const AdvanceMultiSelectContainer({
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
    this.animations = const AdvanceMultiSelectAnimations(),
    this.listViewSettings = const ListViewSettings(),
    this.controller,
  }) : super(key: key);

  final List<AdvanceMultiSelectCard<T>> items;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final int? maxSelectingCount;
  final bool isMaxSelectingCountWithFreezedSelects;
  final MultiSelectDecorations itemsDecoration;
  final MultiSelectTextStyles textStyles;
  final AdvanceMultiSelectAnimations animations;
  final ListViewSettings listViewSettings;
  final MultiSelectController<T>? controller;

  final void Function(List<T> selectedItems, T selectedItem)? onMaximumSelected;
  final void Function(List<T> selectedItems, T selectedItem) onChange;

  @override
  _AdvanceMultiSelectContainerState createState() =>
      _AdvanceMultiSelectContainerState<T>();
}

class _AdvanceMultiSelectContainerState<T> extends State<AdvanceMultiSelectContainer<T>> {

  @override
  void initState() {
     _items = widget.items;
    super.initState();
  }

  late final List<AdvanceMultiSelectCard<T>> _items;
  final _selectedItems = <AdvanceMultiSelectCard<T>>[];
  int _freezeSelectedItemsCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
