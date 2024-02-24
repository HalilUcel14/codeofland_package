import 'package:codeofland/codeofland.dart';
import 'package:equatable/equatable.dart';

final class RoleLevelSecurityModel extends Equatable
    implements BaseModel<RoleLevelSecurityModel> {
  @override
  final String? uid;
  final bool? read;
  final bool? write;
  final bool? update;
  final bool? delete;

  const RoleLevelSecurityModel({
    this.read,
    this.write,
    this.update,
    this.delete,
    this.uid,
  });

  @override
  List<Object?> get props => [read, write, update, delete, uid];

  @override
  RoleLevelSecurityModel fromJson(Map<String, dynamic> json) {
    return RoleLevelSecurityModel(
      read: json['read'],
      write: json['write'],
      update: json['update'],
      delete: json['delete'],
      uid: json['id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'read': read,
      'write': write,
      'update': update,
      'delete': delete,
    };
  }
}
