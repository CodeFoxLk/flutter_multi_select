import 'package:flutter/material.dart';
import '../const/const_values.dart';

class WrapSettings {
  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;

  const WrapSettings({
    Key? key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = wrapSpacing,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = wrapRunSpacing,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    List<Widget> children = const <Widget>[],
  });
}
