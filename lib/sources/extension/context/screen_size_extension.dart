import 'package:flutter/material.dart';

extension ScreenSizeContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  //
  Size get screenSize => MediaQuery.sizeOf(this);
  //
  Orientation get screenOrientation => MediaQuery.orientationOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

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

extension ViewPaddingContextExtension on BuildContext {
  double get viewPaddingTop => viewPadding.top;
  double get viewPaddingBottom => viewPadding.bottom;
  double get viewPaddingLeft => viewPadding.left;
  double get viewPaddingRight => viewPadding.right;

  double get viewPaddingHorizontal => viewPaddingLeft + viewPaddingRight;
  double get viewPaddingVertical => viewPaddingTop + viewPaddingBottom;
}

extension ViewInsertContextExtension on BuildContext {
  double get viewInsertTop => viewInsets.top;
  double get viewInsertBottom => viewInsets.bottom;
  double get viewInsertLeft => viewInsets.left;
  double get viewInsertRight => viewInsets.right;

  double get viewInsertHorizontal => viewInsertLeft + viewInsertRight;
  double get viewInsertVertical => viewInsertTop + viewInsertBottom;
}
