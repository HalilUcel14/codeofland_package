import '../../../codeofland.dart';

abstract class CloudFirestoreService {
  Future<void> addDocument(
      {String? documentId, required Map<String, dynamic> data}) async {}
  Future<void> updateDocument(
      {required String documentId, required Map<String, dynamic> data}) async {}
  Future<void> deleteDocument({required String documentId}) async {}

  Stream<List<CloudFirestoreModel?>> getStreamDataList();

  Future<CloudFirestoreModel?> getDataWithDocumentId(
      {required String documentId});
}
