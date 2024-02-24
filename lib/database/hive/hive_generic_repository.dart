// ignore_for_file: unused_element

import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

abstract class HiveRepository<T> {
  late final String boxName;
  late Box<T> hiveBox;

  HiveRepository({required this.boxName}) {
    hiveBox = Hive.box<T>(boxName);
  }

  Future<void> openBox() async {
    if (!hiveBox.isOpen) {
      await hiveBox.close();
      hiveBox = await Hive.openBox<T>(boxName);
    }
  }

  Future<void> closeBox() async {
    if (hiveBox.isOpen) {
      await hiveBox.close();
    }
  }

  Future<bool> addItem(String id, T item) async {
    try {
      await openBox();
      hiveBox.put(id, item);
      return true;
    } catch (error) {
      throw HiveException<T>.write(error, item: item).debugPrint;
    }
  }

  Future<List<T>> getAllItem() async {
    try {
      await openBox();
      return hiveBox.values.toList();
    } catch (error) {
      throw HiveException<T>.read(error).debugPrint;
    }
  }

  Future<T?> getItemById(String id) async {
    try {
      await openBox();
      return hiveBox.get(id);
    } catch (error) {
      throw HiveException<T>.read(error).debugPrint;
    }
  }

  Future<bool> update(String id, T item) async {
    try {
      await openBox();
      hiveBox.put(id, item);
      return true;
    } catch (error) {
      throw HiveException<T>.update(error, item: item).debugPrint;
    }
  }

  Future<bool> delete(String id) async {
    try {
      await openBox();
      hiveBox.delete(id);
      return true;
    } catch (error) {
      throw HiveException<T>.delete(error).debugPrint;
    }
  }
}
