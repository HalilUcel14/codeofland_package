class CloudFirestoreException implements Exception {
  final String message;
  CloudFirestoreException({required this.message});

  @override
  String toString() {
    return '$this :: Error On [Firebase Cloud_Firestore] error: $message';
  }
}
