import 'package:flutter/material.dart';

class CustomShowDialog {
  final BuildContext context;
  final Widget Function() builder;
  final bool barrierDismissible;
  final Offset? anchorOffset;
  final Color? barrierColor;
  final String? barrierLabel;
  final RouteSettings? routeSettings;
  final bool useSafeArea;
  final bool useRootNavigator;
  final bool? maintainState;
  final TraversalEdgeBehavior? traversalEdgeBehavior;

  CustomShowDialog({
    required this.context,
    required this.builder,
    this.barrierDismissible = false,
    this.anchorOffset,
    this.barrierColor,
    this.barrierLabel,
    this.routeSettings,
    this.useSafeArea = true,
    this.useRootNavigator = true,
    this.maintainState,
    this.traversalEdgeBehavior,
  });

  Future<T?> show<T>() async {
    return showDialog<T>(
      context: context,
      builder: (context) => builder(),
      barrierDismissible: barrierDismissible,
      anchorPoint: anchorOffset,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      traversalEdgeBehavior: traversalEdgeBehavior,
    );
  }
}
