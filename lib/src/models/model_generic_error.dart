import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_generic_error.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class GenericError extends Entity {
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
