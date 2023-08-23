import 'package:firebase_storage/firebase_storage.dart';

import '../../../codeofland.dart';

class FirebaseStorageManager extends FirebaseStorageService {
  static FirebaseStorageManager? _of;
  static FirebaseStorageManager of(Reference reference) =>
      _of ??= FirebaseStorageManager._init(reference);
  FirebaseStorageManager._init(this._reference);

  final Reference _reference;

  @override
  Future<List<String>?> getDownloadListUrl(String file) {
    return _reference.child(file).listAll().then((value) {
      return value.items.map((e) => e.fullPath).toList();
    });
  }

  @override
  Future<String?> getDownloadUrl(String imageUrl) {
    return _reference.child(imageUrl).getDownloadURL();
  }
}
