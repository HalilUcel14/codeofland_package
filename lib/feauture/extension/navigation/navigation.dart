import 'package:flutter/material.dart';

extension NavigatorContextExtension on BuildContext {
  Future<dynamic> push(Widget toPage) async {
    await Navigator.push(this, MaterialPageRoute(builder: (_) => toPage));
  }

  Future<T?> pushReplacement<T>(
    Widget toPage,
  ) async {
    return await Navigator.pushReplacement<T, void>(
      this,
      MaterialPageRoute<T>(
        builder: (_) => toPage,
      ),
    );
  }

  Future<void> pushNamed<T>(String pagePath, {T? agrument}) async {
    await Navigator.pushNamed<T>(this, pagePath, arguments: agrument);
  }

  Future<void> pushNamedAndRemoveUntil<T>(String pagePath,
      {T? argument}) async {
    await Navigator.pushNamedAndRemoveUntil<T>(
      this,
      pagePath,
      (route) => false,
      arguments: argument,
    );
  }

  void pop<T extends Object>({T? result}) async {
    if (canPop()) {
      return Navigator.of(this).pop(result);
    }
  }

  bool canPop() => Navigator.of(this).canPop();
}
