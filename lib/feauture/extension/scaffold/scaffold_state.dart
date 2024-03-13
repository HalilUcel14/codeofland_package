import 'package:flutter/material.dart';

extension ScaffoldStateExtension on GlobalKey<ScaffoldState> {
  void get openDrawerNullable {
    if (currentState == null) return;
    if (currentState!.isDrawerOpen) return;
    currentState!.openDrawer();
  }

  void get closeDrawerNullable {
    if (currentState == null) return;
    if (!currentState!.isDrawerOpen) return;
    currentState!.closeDrawer();
  }

  void get openEndDrawerNullable {
    if (currentState == null) return;
    if (currentState!.isEndDrawerOpen) return;
    currentState!.openEndDrawer();
  }

  void get closeEndDrawerNullable {
    if (currentState == null) return;
    if (!currentState!.isEndDrawerOpen) return;
    currentState!.closeEndDrawer();
  }

  Future<void> pushNamedNulalble(String routeName, {Object? arguments}) async {
    if (currentContext == null) return;
    if (!currentContext!.mounted) return;
    await Navigator.of(currentContext!)
        .pushNamed(routeName, arguments: arguments);
  }

  Future<void> pushReplacementNamedNullable(String routeName,
      {Object? arguments}) async {
    if (currentContext == null) return;
    if (!currentContext!.mounted) return;
    await Navigator.of(currentContext!)
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}
