import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  String get id;

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
