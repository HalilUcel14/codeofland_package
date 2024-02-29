import 'package:flutter/foundation.dart';

final class HiveException<T> implements Exception {
  final Object error;
  final String? type;
  final T? item;

  //
  HiveException(this.error, {this.item, this.type});
  HiveException.write(this.error, {this.item, this.type = "Write"});
  HiveException.read(this.error, {this.item, this.type = "Read"});
  HiveException.update(this.error, {this.item, this.type = "Update"});
  HiveException.delete(this.error, {this.item, this.type = "Delete"});

  get debugPrint {
    if (kDebugMode) {
      print(
        '$this :: Error On [HIVE $type] : Item: $item error: ${error.toString()}',
      );
    }
  }

  @override
  String toString() {
    return '$this :: Error On [HIVE $type] error: ${error.toString()}';
  }
}
