// ignore_for_file: unused_element

import 'package:hive/hive.dart';

abstract class HiveRepository<T> {
  final String boxName;
  //
  late final Box<T> hiveBox;

  HiveRepository({required this.boxName});

  Future<void> openBox() async {
    if (!hiveBox.isOpen) {
      hiveBox = await Hive.openBox<T>(boxName);
    }
  }

  Future<void> closeBox() async {
    if (hiveBox.isOpen) {
      await hiveBox.close();
    }
  }

  Future<void> addItem(String id, T item);

  Future<List<T>> getAllItem();

  Future<T> getItemById(String id);

  Future<void> update(String id, T item);

  Future<void> delete(String id);
}
