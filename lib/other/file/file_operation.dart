import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@immutable
final class FileOperation {
  const FileOperation._();

  static FileOperation? _file;
  static FileOperation get instance {
    _file ??= const FileOperation._();
    return _file!;
  }

  Future<Directory> _fileDirectory(String path) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;

    final dirPath = p.join(appDocPath, path);
    final newDirectory = Directory(dirPath);
    return newDirectory;
  }

  Future<String> createSubDirectory(String path) async {
    try {
      final newDirectory = await _fileDirectory(path);

      if (!await newDirectory.exists()) {
        await newDirectory.create();
      }
      return newDirectory.path;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> removeSubDirectory(String path) async {
    try {
      final newDirectory = await _fileDirectory(path);

      if (await newDirectory.exists()) {
        await newDirectory.delete();
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
