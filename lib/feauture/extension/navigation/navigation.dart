import 'package:flutter/material.dart';

extension NavigatorContextExtension on BuildContext {
  Future<void> push(Widget toPage) async {
    await Navigator.push(this, MaterialPageRoute(builder: (_) => toPage));
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget toPage,
    TO? result,
  ) async {
    return await Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute<T>(
        builder: (_) => toPage,
      ),
      result: result,
    );
  }

  Future<T?> pushNamed<T>(String pagePath, {T? agrument}) async {
    return await Navigator.pushNamed<T>(this, pagePath, arguments: agrument);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String pagePath, {T? argument}) async {
    return await Navigator.pushNamedAndRemoveUntil<T>(
      this,
      pagePath,
      (route) => false,
      arguments: argument,
    );
  }

  void pop<T>({T? result}) async {
    if (canPop()) {
      return Navigator.of(this).pop<T>(result);
    }
    return null;
  }

  bool canPop() => Navigator.of(this).canPop();
}
