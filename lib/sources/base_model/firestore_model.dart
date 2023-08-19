abstract class CloudFirestoreModelService<T> {
  String? uuid;
  CloudFirestoreModelService(this.uuid);

  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
