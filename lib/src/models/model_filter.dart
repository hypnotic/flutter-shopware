import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_filter.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class Filter {
  const Filter(
    this.type,
    this.field,
    this.value,
  );

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);

  final String type;
  final String field;
  final String value;
}
