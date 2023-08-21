import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../codeofland.dart';

abstract class CloudFirestoreService {
  Future<void> addDocument(
      {String? documentId, required Map<String, dynamic> data}) async {}
  Future<void> updateDocument(
      {required String documentId, required Map<String, dynamic> data}) async {}
  Future<void> deleteDocument({required String documentId}) async {}

  Stream<QuerySnapshot<Map<String, dynamic>>> get getStream;

  Future<List<CloudFirestoreModel?>> getListDataFromCloud();

  Future<CloudFirestoreModel?> getDataWithDocumentId(
      {required String documentId});
}
