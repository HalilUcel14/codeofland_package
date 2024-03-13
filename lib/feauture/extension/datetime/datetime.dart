extension DateTimeExtension on DateTime {
  /// Check if the date is before the current date
  bool isBeforeDuration(Duration duration) =>
      isBefore(DateTime.now().subtract(duration));

  /// Check if the date is after the current date
  bool isAfterDuration(Duration duration) =>
      isAfter(DateTime.now().add(duration));
}
