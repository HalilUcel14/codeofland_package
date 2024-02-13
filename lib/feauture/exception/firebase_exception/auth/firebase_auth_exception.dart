final class FirebaseAuthException implements Exception {
  final String message;
  FirebaseAuthException(this.message);

  @override
  String toString() {
    return '$this :: Error On [AUTH on FİREBASE] error: $message';
  }
}
