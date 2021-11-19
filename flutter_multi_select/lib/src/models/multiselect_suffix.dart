import 'package:flutter/cupertino.dart';

class MultiSelectSuffix {
  final Widget suffix;
  final Widget? disabledSuffix;
  final Widget? selectedSuffix;
  
  MultiSelectSuffix({required this.suffix, this.disabledSuffix, this.selectedSuffix});
}
