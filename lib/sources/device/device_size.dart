import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

class DeviceSize {
  final BuildContext _context;
  //
  static DeviceSize? _of;
  static DeviceSize of(BuildContext context) => _of ??= DeviceSize._(context);
  DeviceSize._(this._context);
  //

  static double mobileWidth = 500;
  static double tabletWidth = 800;
  static double desktopWidth = 1200;
  //
  bool get isMobile => _context.screenWidth < mobileWidth;
  bool get isTablet =>
      _context.screenWidth >= mobileWidth && _context.screenWidth < tabletWidth;
  bool get isDesktop => _context.screenWidth >= tabletWidth;
  //
}
