import 'package:hive/hive.dart';

abstract class HiveRepository<T> {
  final String boxName;

  HiveRepository({required this.boxName});

  Future<Box<T>> _openBox() async {
    return await Hive.openBox<T>(boxName);
  }

  Future<void> _closeBox(Box<T> box) async {
    await box.close();
  }

  Future<void> addItem(T item);

  Future<List<T>> getAllItem();

  Future<T> getItemById(String id);

  Future<void> update(String id, T item);

  Future<void> delete(String id);
}
