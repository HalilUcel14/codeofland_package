final class FireStorageException implements Exception {
  final String message;
  FireStorageException(this.message);

  @override
  String toString() {
    return '$this :: Error On [STORAGE on FİREBASE] error: $message';
  }
}
