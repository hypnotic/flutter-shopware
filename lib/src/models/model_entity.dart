import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_entity.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class Entity {
  const Entity();

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}
