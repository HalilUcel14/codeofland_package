import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

extension DeviceWidthExtension on BuildContext {
  bool get isMobileWidth =>
      sizeOf.width >= DeviceSize.mobile.min &&
      sizeOf.height <= DeviceSize.mobile.max;
  //
  bool get isTabletWidth =>
      sizeOf.width >= DeviceSize.tablet.min &&
      sizeOf.height <= DeviceSize.tablet.max;
  //
  bool get isDesktopWidth =>
      sizeOf.width >= DeviceSize.desktop.min &&
      sizeOf.height <= DeviceSize.desktop.max;
  //
  bool get isQuadroWidth => sizeOf.width >= DeviceSize.quadraVista.min;
}
