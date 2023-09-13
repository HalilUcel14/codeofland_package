import 'package:flutter/material.dart';

import '../../codeofland.dart';

class ResponsiveWidget extends StatefulWidget {
  const ResponsiveWidget({
    super.key,
    this.layoutKey,
    this.mobileWith,
    this.desktopWith,
    required this.responsiveBuilder,
  });

  final Widget Function(DeviceType deviceType) responsiveBuilder;
  final Key? layoutKey;
  final double? mobileWith;
  final double? desktopWith;

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  DeviceType _deviceType = DeviceType.mobile;

  @override
  Widget build(BuildContext context) {
    if (context.screenWidth < (widget.mobileWith ?? DeviceSize.mobileWidth)) {
      _deviceType = DeviceType.mobile;
    } else if (context.screenWidth <
        (widget.desktopWith ?? DeviceSize.desktopWidth)) {
      _deviceType = DeviceType.tablet;
    } else {
      _deviceType = DeviceType.desktop;
    }
    return widget.responsiveBuilder(_deviceType);
  }
}

enum DeviceType { mobile, tablet, desktop }
