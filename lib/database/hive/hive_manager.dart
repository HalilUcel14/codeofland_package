import 'package:codeofland/codeofland.dart';
import 'package:hive/hive.dart';

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
      HiveException.read(e).debugPrint;
    }
    return [];
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



// class HiveDatabaseManager<T> extends IHiveManager<T> {
//   Future<Box<T>> get boxT async {
//     try {
//       return _box.isOpen ? _box : await Hive.openBox<T>(_key);
//     } catch (e) {
//       throw HiveException(e).debugPrint;
//     }
//   }

//   @override
//   Future<void> openBox() async {
//     try {
//       if (Hive.isBoxOpen(_key)) return;

//       _box = await Hive.openBox<T>(_key);
//     } catch (e) {
//       throw HiveException(e).debugPrint;
//     }
//   }

//   @override
//   Future<void> closeBox() async {
//     try {
//       final myBox = await boxT;
//       myBox.close();
//     } catch (e) {
//       throw HiveException(e).debugPrint;
//     }
//   }

//   @override
//   Future<void> clear() async {
//     try {
//       final myBox = await boxT;
//       myBox.clear();
//     } catch (e) {
//       throw HiveException(e).debugPrint;
//     }
//   }

//   @override
//   Future<List<T>> listBox() async {
//     try {
//       final myBox = await boxT;
//       return myBox.values.toList();
//     } catch (e) {
//       throw HiveException.read(e).debugPrint;
//     }
//   }

//   @override
//   Future<T?> readBox(String id) async {
//     try {
//       final myBox = await boxT;
//       return myBox.get(id);
//     } catch (e) {
//       throw HiveException.read(e).debugPrint;
//     }
//   }

//   @override
//   Future<bool> addBox(String id, T item) async {
//     try {
//       final myBox = await boxT;
//       await myBox.put(id, item);
//       return true;
//     } catch (e) {
//       throw HiveException.write(e).debugPrint;
//     }
//   }

//   @override
//   Future<bool> deleteBox(String id) async {
//     try {
//       final myBox = await boxT;
//       await myBox.delete(id);
//       return true;
//     } catch (e) {
//       throw HiveException.delete(e).debugPrint;
//     }
//   }

//   @override
//   Future<bool> updateBox(String id, T item) async {
//     try {
//       final myBox = await boxT;
//       await myBox.put(id, item);
//       return true;
//     } catch (e) {
//       throw HiveException.update(e).debugPrint;
//     }
//   }
// }



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