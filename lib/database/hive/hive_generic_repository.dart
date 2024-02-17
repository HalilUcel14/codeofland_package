// ignore_for_file: unused_element

import 'package:hive/hive.dart';

abstract class HiveRepository<T> {
  final String boxName;
  //
  late final Box<T> hiveBox;

  HiveRepository({required this.boxName});

  Future<void> openBox() async {
    hiveBox = await Hive.openBox<T>(boxName);
  }

  Future<void> closeBox(Box<T> box) async {
    await hiveBox.close();
  }

  Future<void> addItem(T item);

  Future<List<T>> getAllItem();

  Future<T> getItemById(String id);

  Future<void> update(T item);

  Future<void> delete(T item);
}
