extension RegexpExtension on String {
  ///--------------------------<EMAİL>--------------------------------
  ///
  /// String email1 = "user@example.com";
  /// String email2 = "user.name123@example.co.uk";
  /// String email3 = "first.last@subdomain.example.com";
  /// String email4 = "invalid-email";
  /// String email5 = "12345@example.com";
  /// String email6 = "user@.example.com";
  /// String email7 = "user@example..com";
  /// String email8 = "user@_example.com";
  /// ------------------------------------------
  /// print(isValidEmail(email1)); // true
  /// print(isValidEmail(email2)); // true
  /// print(isValidEmail(email3)); // true
  /// print(isValidEmail(email4)); // false
  /// print(isValidEmail(email5)); // true
  /// print(isValidEmail(email6)); // false
  /// print(isValidEmail(email7)); // false
  /// print(isValidEmail(email8)); // false
  String get _emailRegexp =>
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  bool get isValidEmailRegex => RegExp(_emailRegexp).hasMatch(this);

  ///--------------------------<PASSWORD>--------------------------------
  ///
  ///   String password1 = "123456"; // Basit seviye
  ///   Basit şifre deseni (en az 6 karakter)
  String get _lowPassword => r'^.{6,}$';
  bool get isValidLowPassword => RegExp(_lowPassword).hasMatch(this);

  ///
  ///   String password2 = "Password123"; // Orta seviye
  ///   Orta seviye şifre deseni (en az 8 karakter, en az bir rakam ve bir harf)
  String get _mediumPassword => r'^(?=.*[0-9])(?=.*[a-zA-Z]).{8,}$';
  bool get isValidMediumPassword => RegExp(_mediumPassword).hasMatch(this);

  ///
  ///   String password3 = "P@ssw0rd!"; // Zor seviye
  ///   Zor seviye şifre deseni (en az 8 karakter, en az bir rakam, bir büyük harf, bir küçük harf ve bir özel karakter)
  String get _highPassword =>
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$';
  bool get isValidHighPassword => RegExp(_highPassword).hasMatch(this);
  //
  //
  ///
  ///  URL REGEX [] --------------------------
  ///
  String get _urlRegex => r'(https?|ftp)://[^\s/$.?#].[^\s]*';
  bool get isValidUrlRegex => RegExp(_urlRegex).hasMatch(this);

  ///
  ///
  ///
  String get _onlyCompanyTaxNumber => r'^[0-9]{10,11}$';
  bool get isCompanyTaxNumber => RegExp(_onlyCompanyTaxNumber).hasMatch(this);
}
