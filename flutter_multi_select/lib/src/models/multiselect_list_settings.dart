import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// List view settings for if [showInListView] = true.
class ListViewSettings {
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  const ListViewSettings(
      {this.scrollDirection = Axis.vertical,
      this.shrinkWrap = true,
      this.reverse = false,
      this.addAutomaticKeepAlives = true,
      this.addRepaintBoundaries = true,
      this.addSemanticIndexes = true,
      this.dragStartBehavior = DragStartBehavior.start,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      this.clipBehavior = Clip.hardEdge,
      this.controller,
      this.primary,
      this.physics,
      this.padding,
      this.separatorBuilder,
      this.cacheExtent,
      this.restorationId});
}
