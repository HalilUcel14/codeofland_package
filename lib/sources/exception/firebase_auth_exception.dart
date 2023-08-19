class CustomFirebaseAuthException implements Exception {
  final String message;
  CustomFirebaseAuthException(this.message);

  @override
  String toString() {
    return '$this :: Error On [Firebase Auth] error: $message';
  }
}
