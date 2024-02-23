abstract class BaseCloudStoreModel<T> {
  String get uuid;

  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
