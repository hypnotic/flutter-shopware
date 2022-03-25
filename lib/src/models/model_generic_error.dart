import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_generic_error.g.dart';

@immutable
@JsonSerializable()
class GenericError {
  const GenericError(
    this.key,
    this.level,
    this.message,
  );

  factory GenericError.fromJson(Map<String, dynamic> json) => _$GenericErrorFromJson(json);

  final String key;
  final String level;
  final String message;
}
