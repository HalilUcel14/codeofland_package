extension ConvertMoneyExtension on String {
  String get addLastTL => "$this TL";
  String get addLastUSD => "$this USD";
  String get addLastEUR => "$this EUR";
  String get addLastCHF => "$this CHF";

  String get addLastTLCode => "$this ";
  String get addLastEURCode => "$this €";
  String get addLastPOUNDCode => "$this £";
  String get addLastCHFCode => "$this ₣";
  String get addLastUSDCode => "$this \$";
}
