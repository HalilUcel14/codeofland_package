import 'package:flutter/material.dart';

extension ScaffoldMessengerExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  //
  showSnackBar(SnackBar snackBar) => scaffoldMessenger.showSnackBar(snackBar);
  //
  showBanner(MaterialBanner banner) =>
      scaffoldMessenger.showMaterialBanner(banner);
  //

  void get removeCurrentSnackbar => scaffoldMessenger.removeCurrentSnackBar();
  void get hideCurrentSnackbar => scaffoldMessenger.hideCurrentSnackBar();
  void get clearSnackBar => scaffoldMessenger.clearSnackBars();
  //
  void get removeMaterialBanner =>
      scaffoldMessenger.removeCurrentMaterialBanner();
  void get hideMaterialBanner => scaffoldMessenger.hideCurrentMaterialBanner();
  void get clearMaterialBanner => scaffoldMessenger.clearMaterialBanners();
}
