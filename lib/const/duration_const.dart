class AppDuration {
  final Duration duration;

  AppDuration.second(int value) : duration = Duration(seconds: value);
  AppDuration.millisecond(int value) : duration = Duration(milliseconds: value);
  AppDuration.microsecond(int value) : duration = Duration(microseconds: value);
  AppDuration.minute(int value) : duration = Duration(minutes: value);
  AppDuration.hour(int value) : duration = Duration(hours: value);
  AppDuration.day(int value) : duration = Duration(days: value);
  AppDuration.week(int value) : duration = Duration(days: value * 7);
  AppDuration.month(int value) : duration = Duration(days: value * 30);
  AppDuration.year(int value) : duration = Duration(days: value * 365);
}
