final class CloudFirestoreException implements Exception {
  final String message;
  CloudFirestoreException(this.message);

  @override
  String toString() {
    return '$this :: Error On [CLOUDFİRESTORE on FİREBASE] error: $message';
  }
}
