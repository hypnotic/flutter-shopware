import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_tax_rule.g.dart';

@immutable
@JsonSerializable()
class TaxRule {
  const TaxRule({
    required this.createdAt,
    this.id,
    this.updatedAt,
  });

  factory TaxRule.fromJson(Map<String, dynamic> json) => _$TaxRuleFromJson(json);

  final String? id;
  final String createdAt;
  final String? updatedAt;
}
