import 'package:codeofland/codeofland.dart';
import 'package:equatable/equatable.dart';

final class RoleLevelSecurityModel extends Equatable
    implements BaseModel<RoleLevelSecurityModel> {
  @override
  final String? id;
  final bool? read;
  final bool? write;
  final bool? update;
  final bool? delete;

  const RoleLevelSecurityModel({
    this.read,
    this.write,
    this.update,
    this.delete,
    this.id,
  });

  @override
  List<Object?> get props => [read, write, update, delete];

  @override
  RoleLevelSecurityModel fromJson(Map<String, dynamic> json) {
    return RoleLevelSecurityModel(
      read: json['read'],
      write: json['write'],
      update: json['update'],
      delete: json['delete'],
      id: json['id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'read': read,
      'write': write,
      'update': update,
      'delete': delete,
    };
  }
}
