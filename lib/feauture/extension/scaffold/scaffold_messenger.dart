import 'package:flutter/material.dart';

extension ScaffoldMessengerContextExtension on BuildContext {
  //
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  //
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackBar,
  ) =>
      scaffoldMessenger.showSnackBar(snackBar);

  //
  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showBanner(MaterialBanner banner) => scaffoldMessenger.showMaterialBanner(
            banner,
          );
  //
  void get removeCurrentSnackbar => scaffoldMessenger.removeCurrentSnackBar();
  //
  void get removeMaterialBanner =>
      scaffoldMessenger.removeCurrentMaterialBanner();
  //
  void get hideCurrentSnackbar => scaffoldMessenger.hideCurrentSnackBar();
  //
  void get hideCurrentBanner => scaffoldMessenger.hideCurrentMaterialBanner();
  //
  void get clearSnackBar => scaffoldMessenger.clearSnackBars();
  //
  void get clearBanner => scaffoldMessenger.clearMaterialBanners();
  //
}
