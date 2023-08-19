import 'package:flutter/material.dart';

extension ScreenSizeContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  //
  Size get screenSize => mediaQuery.size;
  //
  Orientation get screenOrientation => mediaQuery.orientation;
  //

  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;
  //
}

extension ConvertableSizeContextExtension on BuildContext {
  double percentScreenWidth(double widthPercent) {
    assert(
      widthPercent > 0 && widthPercent <= 1,
      'Value must between in 0 - 1',
    );
    return screenWidth * widthPercent;
  }

  double percentScreenHeigth(double heightPercent) {
    assert(
      heightPercent > 0 && heightPercent <= 1,
      'Value must between in 0 - 1',
    );
    return screenHeight * heightPercent;
  }
}
