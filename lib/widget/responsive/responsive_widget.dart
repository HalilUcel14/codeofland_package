import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    this.mobileWidthSize,
    this.desktopWidthSize,
    required this.builder,
    this.layoutBuilderIsActive = false,
  });

  final double? mobileWidthSize;
  final double? desktopWidthSize;
  final bool layoutBuilderIsActive;

  final Widget Function(bool isDesktop, bool isTablet, bool isMobile) builder;

  @override
  Widget build(BuildContext context) {
    bool mobile = false;
    bool tablet = false;
    bool desktop = false;

    if (layoutBuilderIsActive) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < (mobileWidthSize ?? 600)) {
            mobile = true;
            tablet = false;
            desktop = false;
          } else if (constraints.maxWidth < (desktopWidthSize ?? 1200)) {
            tablet = true;
            mobile = false;
            desktop = false;
          } else {
            desktop = true;
            mobile = false;
            tablet = false;
          }
          return builder(desktop, tablet, mobile);
        },
      );
    } else {
      if (context.screenWidth < (mobileWidthSize ?? 600)) {
        mobile = true;
        tablet = false;
        desktop = false;
      } else if (context.screenWidth < (desktopWidthSize ?? 1200)) {
        tablet = true;
        mobile = false;
        desktop = false;
      } else {
        desktop = true;
        mobile = false;
        tablet = false;
      }
      return builder(desktop, tablet, mobile);
    }
  }
}
