extension StringMoneyExtension on String {
  String get priceTL => "$this TL";
  String get priceUSD => "$this USD";
  String get priceEUR => "$this EUR";
  String get priceCHF => "$this CHF";
  //
  String get symbolTL => "$this ₺";
  String get symbolUSD => "$this \$";
  String get symbolEUR => "$this €";
  String get symbolCHF => "$this ₣";
}
