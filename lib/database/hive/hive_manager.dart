import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

abstract class HiveDatabase<T> {
  //
  Future<void> openBox();
  Future<void> closeBox();
  Future<T?> readBox(String id);
  Future<List<T>> listBox();
  Future<bool> addBox(String id, T item);
  Future<bool> updateBox(String id, T item);
  Future<bool> deleteBox(String id);
  //
  Future<void> clear();
}

final class HiveDatabaseManager<T> extends HiveDatabase<T> {
  final String _key = T.toString();

  late Box<T> _box;

  Box<T> get box => _box;

  @override
  Future<void> openBox() async {
    if (Hive.isBoxOpen(_key)) return;
    await Hive.openBox<T>(_key);
    _box = Hive.box<T>(_key);
  }

  @override
  Future<void> closeBox() => _box.close();

  @override
  Future<void> clear() => _box.clear();

  @override
  Future<List<T>> listBox() async {
    try {
      await openBox();
      return _box.values.toList();
    } catch (e) {
      throw HiveException.read(e);
    }
  }

  @override
  Future<T?> readBox(String id) async {
    try {
      await openBox();
      return _box.get(id);
    } catch (e) {
      throw HiveException.read(e);
    }
  }

  @override
  Future<bool> addBox(String id, T item) async {
    try {
      await openBox();
      await _box.put(id, item);
      return true;
    } catch (e) {
      throw HiveException.write(e);
    }
  }

  @override
  Future<bool> deleteBox(String id) async {
    try {
      await openBox();
      await _box.delete(id);
      return true;
    } catch (e) {
      throw HiveException.delete(e);
    }
  }

  @override
  Future<bool> updateBox(String id, T item) async {
    try {
      await openBox();
      await _box.put(id, item);
      return true;
    } catch (e) {
      throw HiveException.update(e);
    }
  }
}
