import 'package:flutter/material.dart';

class LifeCycleWidget extends StatefulWidget {
  final Widget child;
  final Function()? onAppStarted;
  final Function()? onAppPaused;
  final Function()? onAppResumed;
  final Function()? onAppDispose;
  const LifeCycleWidget({
    super.key,
    required this.child,
    this.onAppStarted,
    this.onAppPaused,
    this.onAppResumed,
    this.onAppDispose,
  });

  @override
  State<LifeCycleWidget> createState() => _LifeCycleWidgetState();
}

class _LifeCycleWidgetState extends State<LifeCycleWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.onAppStarted?.call();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.onAppDispose?.call();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) widget.onAppPaused?.call();
    if (state == AppLifecycleState.resumed) widget.onAppResumed?.call();
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
