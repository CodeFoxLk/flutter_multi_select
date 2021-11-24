import 'package:flutter/animation.dart';

class MultiSelectSimpleAnimations {
  final Duration decorationAimationDuration;
  final Curve decorationAnimationCurve;
  //
  final Duration prefixAimationDuration;
  final Curve prefixAnimationCurve;
  //
  final Duration suffixAimationDuration;
  final Curve suffixAnimationCurve;
  //
  final Duration labelAimationDuration;
  final Curve labeAnimationlCurve;

  const MultiSelectSimpleAnimations({
    this.decorationAimationDuration = const Duration(milliseconds: 350),
    this.decorationAnimationCurve = Curves.linear,
    this.prefixAimationDuration = const Duration(milliseconds: 250),
    this.prefixAnimationCurve = Curves.linear,
    this.suffixAimationDuration = const Duration(milliseconds: 250),
    this.suffixAnimationCurve = Curves.linear,
    this.labelAimationDuration = const Duration(milliseconds: 250),
    this.labeAnimationlCurve = Curves.linear,
  });
}

class AdvanceMultiSelectAnimations{
  const AdvanceMultiSelectAnimations();
}