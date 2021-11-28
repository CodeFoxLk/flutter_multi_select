import 'package:flutter/material.dart';

/// [Row] alignment settings for inside of Multi Select Item card.
class MultiSelectAlignments {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  const MultiSelectAlignments({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });
}
