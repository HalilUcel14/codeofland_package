import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  String? get uid;

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
