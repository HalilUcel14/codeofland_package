import 'package:codeofland/codeofland.dart';

extension LanguageModelStringExtension on LanguageModel {
  String toLanguage(bool isTurkish) {
    final value = isTurkish ? tr : en;
    return value ?? '';
  }
}
