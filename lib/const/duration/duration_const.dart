class DurationConst {
  final Duration duration;

  DurationConst.second(int value) : duration = Duration(seconds: value);
  DurationConst.millisecond(int value)
      : duration = Duration(milliseconds: value);
  DurationConst.microsecond(int value)
      : duration = Duration(microseconds: value);
  DurationConst.minute(int value) : duration = Duration(minutes: value);
  DurationConst.hour(int value) : duration = Duration(hours: value);
  DurationConst.day(int value) : duration = Duration(days: value);
  DurationConst.week(int value) : duration = Duration(days: value * 7);
  DurationConst.month(int value) : duration = Duration(days: value * 30);
  DurationConst.year(int value) : duration = Duration(days: value * 365);
}
