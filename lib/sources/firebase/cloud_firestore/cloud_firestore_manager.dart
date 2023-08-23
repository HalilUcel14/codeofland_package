import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../codeofland.dart';

class CloudFirestoreManager extends CloudFirestoreService {
  static CloudFirestoreManager? _of;
  static CloudFirestoreManager of(
          CollectionReference<Map<String, dynamic>> reference) =>
      _of ??= CloudFirestoreManager._(reference);
  CloudFirestoreManager._(this._collectionReference);

  final CollectionReference<Map<String, dynamic>> _collectionReference;

  @override
  Future<void> addDocument(
      {String? documentId, required Map<String, dynamic> data}) async {
    try {
      await _collectionReference.doc(documentId).set(data);
    } catch (e) {
      if (kDebugMode) print('Manager addDocument is Error : $data');
      throw CloudFirestoreException(
        message: 'Manager addDocument is Error : $data',
      );
    }
  }

  @override
  Future<void> updateDocument(
      {required String documentId, required Map<String, dynamic> data}) async {
    try {
      await _collectionReference.doc(documentId).update(data);
    } catch (e) {
      if (kDebugMode) print('Manager updateDocument is Error : $data  ');
      throw CloudFirestoreException(
        message: 'Manager updateDocument is Error : $data',
      );
    }
  }

  @override
  Future<void> deleteDocument({required String documentId}) async {
    try {
      await _collectionReference.doc(documentId).delete();
    } catch (e) {
      if (kDebugMode) print('Manager deleteDocument is Error : $documentId');
      throw CloudFirestoreException(
        message: 'Manager deleteDocument is Error : $documentId',
      );
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get _getStream {
    return _collectionReference.snapshots();
  }

  @override
  Stream<List<CloudFirestoreModel?>> getStreamDataList() {
    try {
      final list = _getStream.map(
        (QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
            .map((document) {
              if (document.exists) {
                return CloudFirestoreModel.fromJson(
                  document.id,
                  document.data(),
                );
              }
              return null;
            })
            .where((element) => element != null)
            .toList(),
      );
      return list;
    } catch (e) {
      if (kDebugMode) {
        print('GetListDataFromCloud has Error $_collectionReference');
      }
      throw CloudFirestoreException(
          message: 'GetListDataFromCloud has Error $_collectionReference');
    }
  }

  @override
  Future<CloudFirestoreModel?> getDataWithDocumentId(
      {required String documentId}) async {
    try {
      final value = await _collectionReference.doc(documentId).get();
      if (!value.exists) return null;
      if (value.data() == null) return null;
      return CloudFirestoreModel.fromJson(value.id, value.data()!);
    } catch (e) {
      if (kDebugMode) {
        print('getDataWithDocumentId has Error $_collectionReference');
      }
      throw CloudFirestoreException(
          message: 'getDataWithDocumentId has Error $_collectionReference');
    }
  }
}
