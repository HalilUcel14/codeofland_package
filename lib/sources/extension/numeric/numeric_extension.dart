import 'package:flutter/material.dart';

extension NumericExtension on num {
  BorderRadius get circleRadius => BorderRadius.circular(toDouble());

  SizedBox get withHeightBox => SizedBox(
        height: toDouble(),
      );
  SizedBox get withWidthBox => SizedBox(
        width: toDouble(),
      );
}
