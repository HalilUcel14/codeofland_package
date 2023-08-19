import 'package:flutter/material.dart';

import '../../../codeofland.dart';

extension KeyboardFunctionContext on BuildContext {
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;
}
