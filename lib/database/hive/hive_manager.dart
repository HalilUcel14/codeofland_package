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

class HiveDatabaseManager<T> extends HiveDatabase<T> {
  final String _key;

  late Box<T> _box;

  HiveDatabaseManager() : _key = T.toString();

  Future<Box<T>> get boxT async {
    try {
      return _box.isOpen ? _box : await Hive.openBox<T>(_key);
    } catch (e) {
      throw HiveException(e).debugPrint;
    }
  }

  @override
  Future<void> openBox() async {
    try {
      if (Hive.isBoxOpen(_key)) return;

      _box = await Hive.openBox<T>(_key);
    } catch (e) {
      throw HiveException(e).debugPrint;
    }
  }

  @override
  Future<void> closeBox() async {
    try {
      final myBox = await boxT;
      myBox.close();
    } catch (e) {
      throw HiveException(e).debugPrint;
    }
  }

  @override
  Future<void> clear() async {
    try {
      final myBox = await boxT;
      myBox.clear();
    } catch (e) {
      throw HiveException(e).debugPrint;
    }
  }

  @override
  Future<List<T>> listBox() async {
    try {
      final myBox = await boxT;
      return myBox.values.toList();
    } catch (e) {
      throw HiveException.read(e).debugPrint;
    }
  }

  @override
  Future<T?> readBox(String id) async {
    try {
      final myBox = await boxT;
      return myBox.get(id);
    } catch (e) {
      throw HiveException.read(e).debugPrint;
    }
  }

  @override
  Future<bool> addBox(String id, T item) async {
    try {
      final myBox = await boxT;
      await myBox.put(id, item);
      return true;
    } catch (e) {
      throw HiveException.write(e).debugPrint;
    }
  }

  @override
  Future<bool> deleteBox(String id) async {
    try {
      final myBox = await boxT;
      await myBox.delete(id);
      return true;
    } catch (e) {
      throw HiveException.delete(e).debugPrint;
    }
  }

  @override
  Future<bool> updateBox(String id, T item) async {
    try {
      final myBox = await boxT;
      await myBox.put(id, item);
      return true;
    } catch (e) {
      throw HiveException.update(e).debugPrint;
    }
  }
}



// final class HiveDatabaseManager<T> extends HiveDatabase<T> {
//   final String _key = T.toString();

//   late Box<T>? _box;

//   Box<T> get box {
//     if (_box == null) {
//       throw HiveException.read('Kutu $_key null');
//     }

//     if (!_box!.isOpen) {
//       throw HiveException.read('Kutu $_key açık değil');
//     }

//     return _box!;
//   }

//   @override
//   Future<void> openBox() async {
//     if (_box == null) {
//       if (!_box!.isOpen) {
//         _box = await Hive.openBox<T>(_key);
//       }
//     }
//   }

//   @override
//   Future<void> closeBox() async {
//     if (box.isOpen) {
//       await box.close();
//     }
//   }

//   @override
//   Future<void> clear() => box.clear();

//   @override
//   Future<List<T>> listBox() async {
//     try {
//       await openBox();
//       return box.values.toList();
//     } catch (e) {
//       throw HiveException.read(e);
//     }
//   }

//   @override
//   Future<T?> readBox(String id) async {
//     try {
//       await openBox();
//       return box.get(id);
//     } catch (e) {
//       throw HiveException.read(e);
//     }
//   }

//   @override
//   Future<bool> addBox(String id, T item) async {
//     try {
//       await openBox();
//       await box.put(id, item);
//       return true;
//     } catch (e) {
//       throw HiveException.write(e);
//     }
//   }

//   @override
//   Future<bool> deleteBox(String id) async {
//     try {
//       await openBox();
//       await box.delete(id);
//       return true;
//     } catch (e) {
//       throw HiveException.delete(e);
//     }
//   }

//   @override
//   Future<bool> updateBox(String id, T item) async {
//     try {
//       await openBox();
//       await box.put(id, item);
//       return true;
//     } catch (e) {
//       throw HiveException.update(e);
//     }
//   }
// }