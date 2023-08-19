import 'package:flutter/material.dart';

extension NumericPaddingExtension on num {
  EdgeInsets get padAll => EdgeInsets.all(toDouble());
  EdgeInsets get padHorizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get padVertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get padOnlyTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get padOnlyBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get padOnlyLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get padOnlyRight => EdgeInsets.only(right: toDouble());
}
