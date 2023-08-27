import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;

  final Offset? startOffset;
  final Offset? endOffset;

  SlideRoute({
    required this.builder,
    this.startOffset,
    this.endOffset,
    bool fullscreenDialog = false,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
        );
  SlideRoute.leftToRight({
    required this.builder,
    bool fullscreenDialog = false,
  })  : startOffset = const Offset(-1, 0),
        endOffset = const Offset(0, 0),
        super(
          fullscreenDialog: fullscreenDialog,
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
        );

  SlideRoute.rightToLeft({
    required this.builder,
    bool fullscreenDialog = false,
  })  : startOffset = const Offset(1, 0),
        endOffset = const Offset(0, 0),
        super(
          fullscreenDialog: fullscreenDialog,
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
        );

  SlideRoute.topToBottom({
    required this.builder,
    bool fullscreenDialog = false,
  })  : startOffset = const Offset(0, -1),
        endOffset = const Offset(0, 0),
        super(
          fullscreenDialog: fullscreenDialog,
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
        );

  SlideRoute.bottomToTop({
    required this.builder,
    bool fullscreenDialog = false,
  })  : startOffset = const Offset(0, 1),
        endOffset = const Offset(0, 0),
        super(
          fullscreenDialog: fullscreenDialog,
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: startOffset ?? const Offset(1, 0),
        end: endOffset ?? const Offset(0, 0),
      ).animate(animation),
      child: child,
    );
  }
}
