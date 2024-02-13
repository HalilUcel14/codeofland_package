abstract class BaseCloudStoreModel<T> {
  final String uuid;
  BaseCloudStoreModel(this.uuid);

  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
