import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

extension DeviceWidthExtension on BuildContext {
  bool get isMobileWidth =>
      sizeOf.width >= DeviceEnum.mobile.min &&
      sizeOf.height <= DeviceEnum.mobile.max;
  //
  bool get isTabletWidth =>
      sizeOf.width >= DeviceEnum.tablet.min &&
      sizeOf.height <= DeviceEnum.tablet.max;
  //
  bool get isDesktopWidth =>
      sizeOf.width >= DeviceEnum.desktop.min &&
      sizeOf.height <= DeviceEnum.desktop.max;
  //
  bool get isQuadroWidth => sizeOf.width >= DeviceEnum.quadraVista.min;
}
