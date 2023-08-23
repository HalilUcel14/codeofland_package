import '../../codeofland.dart';

class LanguageModel extends BaseModel<LanguageModel> {
  String? tr;
  String? en;

  LanguageModel({
    this.tr,
    this.en,
  });

  LanguageModel.fromJson(Map<String, dynamic> json) {
    tr = json['tr'];
    en = json['en'];
  }

  @override
  LanguageModel fromJson(Map<String, dynamic> json) {
    return LanguageModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tr'] = tr;
    data['en'] = en;
    return data;
  }
}
