import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

final class HiveInitializer {
  late String _hivePath;

  static HiveInitializer? _of;
  static HiveInitializer get of => _of ??= HiveInitializer._();

  HiveInitializer._();

  ///
  Future<void> init() async {
    final appDirectory = await path_provider.getApplicationDocumentsDirectory();
    _hivePath = "${appDirectory.path}/HiveDatabase";
    await Hive.initFlutter(_hivePath);
  }

  Future<void> close() async {
    await Hive.close();
  }

  String get hivePath => _hivePath;
}
