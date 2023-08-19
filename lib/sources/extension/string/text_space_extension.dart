extension TextInSpaceExtension on String {
  String get addRightSpace => "$this ";
  String get addRightTabSpace => "$this   ";
  String get addLeftSpace => " $this";
  String get addLeftTabSpace => "   $this";
  String get addSpace => " $this ";
  String get addTabSpace => "   $this   ";
}
