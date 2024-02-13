//import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

class WebLifeCycleObserver {
  static WebLifeCycleObserver? _of;
  static WebLifeCycleObserver get of => _of ??= WebLifeCycleObserver._();
  WebLifeCycleObserver._();

  /// ----------------------------------------------
  ///  Uygulama Başlatıldığında Yapılması gerekenler.
  /// [onStart] yapılması gerekenler.
  onStart(Function(html.Event e) onStartFunction) {
    html.window.onLoad.listen((html.Event e) => onStartFunction(e));
  }

  /// ----------------------------------------------
  ///  Uygulama Kapatıldığında Yapılması gerekenler.
  /// [onClose] yapılması gerekenler.
  onClose(Function(html.Event e) onCloseFunction) {
    html.window.onBeforeUnload.listen((html.Event e) => onCloseFunction(e));
  }

  /// ----------------------------------------------
  /// Uygulama Pencere Boyutu Değiştiği An
  /// [onChangeBrowserSize] yapılması gerekenler.
  onChangeBrowserSize(Function(html.Event e) onChangeBrowserSizeFunction) {
    html.window.onResize
        .listen((html.Event e) => onChangeBrowserSizeFunction(e));
  }

  /// ----------------------------------------------
  /// Uygulama Odak Kayıp Ettiğinde
  /// [onFocusLost] yapılması gerekenler.
  onFocusLost(Function(html.Event e) onFocusLostFunction) {
    html.window.onBlur.listen((html.Event e) => onFocusLostFunction(e));
  }

  /// ----------------------------------------------
  /// Uygulama Odak Kazandığında
  /// [onFocus] yapılması gerekenler.
  onFocus(Function(html.Event e) onFocusFunction) {
    html.window.onFocus.listen((html.Event e) => onFocusFunction(e));
  }
}
