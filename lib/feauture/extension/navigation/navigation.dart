import 'package:flutter/material.dart';

extension NavigatorContextExtension on BuildContext {
  Future<dynamic> push(Widget toPage) async {
    await Navigator.push(this, MaterialPageRoute(builder: (_) => toPage));
  }

  Future<dynamic> pushReplacement(Widget toPage) async {
    await Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (_) => toPage,
        ));
  }

  Future<dynamic> pushNamed(String pagePath, {Object? agrument}) async {
    await Navigator.pushNamed(this, pagePath, arguments: agrument);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String pagePath,
      {Object? argument}) async {
    await Navigator.pushNamedAndRemoveUntil(
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
