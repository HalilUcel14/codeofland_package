class CustomException implements Exception {
  final String message;
  CustomException(this.message);
  @override
  String toString() {
    return '$this :: Error On [Custom Exception] error: $message';
  }
}
