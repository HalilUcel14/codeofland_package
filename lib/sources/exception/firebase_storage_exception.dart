class FirebaseStorageException implements Exception {
  final String message;
  FirebaseStorageException(this.message);

  @override
  String toString() {
    return '$this :: Error On [Firebase Storage] error: $message';
  }
}
