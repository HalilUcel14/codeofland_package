import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;
  //

  Future<String?> getDownloadUrl(String imageUrl);

  Future<List<String>?> getDownloadListUrl(String file);
}
