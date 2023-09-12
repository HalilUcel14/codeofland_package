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
    double mobileSize = widget.mobileWith ?? DeviceSize.mobileWidth;
    double desktopSize = widget.desktopWith ?? DeviceSize.desktopWidth;

    return LayoutBuilder(
      key: widget.layoutKey,
      builder: (context, constraint) {
        setState(() {
          _deviceType = constraint.maxWidth < mobileSize
              ? DeviceType.mobile
              : constraint.maxWidth >= mobileSize &&
                      constraint.maxWidth < desktopSize
                  ? DeviceType.tablet
                  : DeviceType.desktop;
        });

        return widget.responsiveBuilder(_deviceType);
      },
    );
  }
}

enum DeviceType { mobile, tablet, desktop }
