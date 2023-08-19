import 'package:flutter/material.dart';

extension ExpandedExtension on Widget {
  Widget expanded({flex = 1, Key? key}) => Expanded(
        flex: flex,
        key: key,
        child: this,
      );

  Widget fittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
  }) =>
      FittedBox(
        key: key,
        alignment: alignment,
        clipBehavior: clipBehavior,
        fit: fit,
        child: this,
      );

  Widget padding({required EdgeInsetsGeometry pad, Key? key}) => Padding(
        padding: pad,
        key: key,
        child: this,
      );

  Widget flexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) =>
      Flexible(
        flex: flex,
        fit: fit,
        key: key,
        child: this,
      );

  Widget isVisibility({
    required bool visible,
    bool maintainState = false,
    bool maintainAnimation = false,
    bool maintainSize = false,
    bool maintainSemantics = false,
    bool maintainInteractivity = false,
    Key? key,
  }) {
    return Visibility(
      visible: visible,
      maintainAnimation: maintainAnimation,
      maintainInteractivity: maintainInteractivity,
      maintainSemantics: maintainSemantics,
      maintainSize: maintainSize,
      maintainState: maintainState,
      key: key,
      child: this,
    );
  }
}
