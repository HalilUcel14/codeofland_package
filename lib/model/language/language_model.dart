import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class LanguageModel extends Equatable {
  final String? tr;
  final String? en;

  const LanguageModel({this.tr, this.en});

  @override
  List<Object?> get props => [tr, en];
}
