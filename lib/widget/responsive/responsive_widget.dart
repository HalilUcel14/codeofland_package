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

  final Widget Function(bool isDesktop, bool isTablet, bool isMobile)
      responsiveBuilder;
  final Key? layoutKey;
  final double? mobileWith;
  final double? desktopWith;

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  bool _isDesktop = false;
  bool _isTablet = false;
  bool _isMobile = false;

  @override
  Widget build(BuildContext context) {
    if (context.screenWidth < (widget.mobileWith ?? DeviceSize.mobileWidth)) {
      _isMobile = true;
      _isTablet = false;
      _isDesktop = false;
    } else if (context.screenWidth <
        (widget.desktopWith ?? DeviceSize.desktopWidth)) {
      _isTablet = true;
      _isDesktop = false;
      _isMobile = false;
    } else {
      _isDesktop = true;
      _isTablet = false;
      _isMobile = false;
    }
    return widget.responsiveBuilder(_isDesktop, _isTablet, _isMobile);
  }
}

/// Device type enum

enum DeviceType { mobile, tablet, desktop }
