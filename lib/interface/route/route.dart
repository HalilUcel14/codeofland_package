import 'package:flutter/material.dart';

abstract class IRoute {
  late final Map<String, Widget Function()> route;
}
