import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  //
  /// --- [TR] ---
  /// Bu fonksiyon, verilen bir Widget'ın ekran üzerinde kapladığı alanın boyutunu döndürür.
  /// Parametre olarak bir Widget alır ve MediaQuery sınıfını kullanarak ekran boyutunu hesaplar.
  /// Sonuç olarak, Widget'ın kapladığı alanın boyutunu içeren bir Size nesnesi döndürür.
  /// --- [EN] ---
  /// This function returns the size of the area covered by a given Widget on the screen.
  /// It takes a Widget as a parameter and calculates the screen size using the MediaQuery class.
  /// As a result, it returns a Size object containing the dimensions of the area covered by the Widget.
  Size get sizeOf => MediaQuery.sizeOf(this);

  EdgeInsets get paddingOf => MediaQuery.paddingOf(this);
  //
  Orientation get orientationOf => MediaQuery.orientationOf(this);
  //
  EdgeInsets get viewInstertOf => MediaQuery.viewInsetsOf(this);
  //
  EdgeInsets get viewPaddingOf => MediaQuery.viewPaddingOf(this);
  //
  double get textScaleFactorOf => MediaQuery.textScaleFactorOf(this);
  //
}

extension KeyboardContextExtension on BuildContext {
  bool get isKeyboardOpen => viewInstertOf.bottom > 0;
}
