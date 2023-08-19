import 'package:flutter/material.dart';

import '../../../codeofland.dart';

extension NavigatorContextExtension on BuildContext {
  ///
  /// Kullanım Şekli Bir sayfadan bir diğerine gidiş içindir
  ///  [context.push(HomeWidget());]
  Future<dynamic> push(Widget goToPage) async {
    await Navigator.push(this, MaterialPageRoute(builder: (_) => goToPage));
  }

  Future<dynamic> pushReplacement(Widget goToPage) async {
    await Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (_) => goToPage));
  }

  void pop({dynamic result}) async {
    if (canPop()) {
      return Navigator.of(this).pop(result);
    }
    throw CustomException('Navigate Can Not Pop');
  }

  bool canPop() => Navigator.of(this).canPop();

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
  //
}
