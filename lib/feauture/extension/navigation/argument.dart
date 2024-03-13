import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ModalRouteExtension on BuildContext {
  T? getArgumentsWithTpye<T>() {
    try {
      Object? object = ModalRoute.of(this)!.settings.arguments;
      //
      if (object == null) return null;
      //
      if (object is T) return object as T;
      return null;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('${T.toString()} Argument Call Error:  ${e.toString()}');
      }
      return null;
    }
  }
}
