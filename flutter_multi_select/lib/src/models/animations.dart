import 'package:flutter/animation.dart';

/// Animation settings for multiselect items
class MultiSelectAnimations {
  ///Decoration changing animation duration
  final Duration decorationAimationDuration;

  ///Decoration changing in and out animation curve
  final Curve decorationAnimationCurve;

  ///Prefix icons changing animation duration.
  final Duration prefixAimationDuration;

  ///Prefix icons changing in and out animation curve.
  final Curve prefixAnimationCurve;

  ///Suffix icons changing animation duration.
  final Duration suffixAimationDuration;
  ////label changing in and out animation curve.
  final Curve suffixAnimationCurve;

  ///label changing animation duration.
  final Duration labelAimationDuration;

  ///label changing in and out animation curve.
  final Curve labeAnimationlCurve;

  const MultiSelectAnimations({
    this.decorationAimationDuration = const Duration(milliseconds: 250),
    this.decorationAnimationCurve = Curves.linear,
    this.prefixAimationDuration = const Duration(milliseconds: 150),
    this.prefixAnimationCurve = Curves.linear,
    this.suffixAimationDuration = const Duration(milliseconds: 150),
    this.suffixAnimationCurve = Curves.linear,
    this.labelAimationDuration = const Duration(milliseconds: 200),
    this.labeAnimationlCurve = Curves.linear,
  });
}
