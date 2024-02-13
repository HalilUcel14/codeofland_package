import 'package:equatable/equatable.dart';

abstract class BaseModel<T extends Equatable> {
  final String? id;
  BaseModel({this.id});

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
