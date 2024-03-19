import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IHiveManager<T> {
  final String _key;

  late Box<T> _box;

  Box<T> get box => _box;

  IHiveManager() : _key = T.toString() {
    openBox();
  }

  //
  Future<void> openBox() async {
    await Hive.openBox<T>(_key);
    _box = Hive.box<T>(_key);
  }

  void closeBox() {
    _box.close();
  }

  //
  ValueListenable<Box<T>> get listenable => _box.listenable();

  T? readBox(String id) {
    try {
      return _box.get(id);
    } catch (e) {
      throw HiveException.read(e).debugPrint;
    }
  }

  List<T> listBox() {
    try {
      return _box.values.toList();
    } catch (e) {
      throw HiveException.read(e).debugPrint;
    }
  }

  Future<bool> addBox(String id, T item) async {
    try {
      await _box.put(id, item);
      return true;
    } catch (e) {
      throw HiveException.write(e).debugPrint;
    }
  }

  Future<bool> updateBox(String id, T item) async {
    try {
      await _box.put(id, item);
      return true;
    } catch (e) {
      throw HiveException.update(e).debugPrint;
    }
  }

  Future<bool> deleteBox(String id) async {
    try {
      await _box.delete(id);
      return true;
    } catch (e) {
      throw HiveException.delete(e).debugPrint;
    }
  }

  //
  Future<int> clear() async {
    try {
      return await _box.clear();
    } catch (e) {
      throw HiveException(e);
    }
  }
}
