extension StringNullableExtension on String? {
  bool get isNullOrEmpty {
    if (this == null) return true;
    if (this!.isEmpty) return true;
    return false;
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
