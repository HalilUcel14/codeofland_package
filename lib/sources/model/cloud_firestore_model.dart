class CloudFirestoreModel {
  final String? id;
  final Map<String, dynamic> data;

  CloudFirestoreModel({required this.data, this.id});

  factory CloudFirestoreModel.fromJson(String id, Map<String, dynamic> json) {
    return CloudFirestoreModel(data: json, id: id);
  }

  Map<String, dynamic> toJson() {
    return data;
  }
}
