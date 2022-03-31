import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_sort.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class Sort {
  const Sort({
    required this.field,
    this.order,
    this.naturalSorting,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
  Map<String, dynamic> toJson() => _$SortToJson(this);

  final String field;
  final String? order;
  final bool? naturalSorting;
}
