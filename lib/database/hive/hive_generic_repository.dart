// ignore_for_file: unused_element

import 'package:hive/hive.dart';

abstract class HiveRepository<T> {
  final String boxName;
  //
  Box<T> get hiveBox;

  HiveRepository({required this.boxName});

  ///  if (!hiveBox.isOpen) {
  ///    hiveBox = await Hive.openBox<T>(boxName);
  ///  }
  Future<void> openBox();

  ///  if (hiveBox.isOpen) {
  ///    await hiveBox.close();
  ///  }
  Future<void> closeBox();

  Future<void> addItem(String id, T item);

  Future<List<T>> getAllItem();

  Future<T> getItemById(String id);

  Future<void> update(String id, T item);

  Future<void> delete(String id);
}
