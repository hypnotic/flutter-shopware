import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_currency.g.dart';

@immutable
@JsonSerializable()
class Currency {
  const Currency({
    required this.isoCode,
    required this.symbol,
    required this.shortName,
    required this.name,
    required this.id,
    required this.createdAt,
    this.position,
    this.decimalPrecision,
    this.factor,
    this.isSystemDefault,
    this.updatedAt,
    this.customFields,
    this.translated,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

  final String id;
  final String isoCode;
  final String symbol;
  final String shortName;
  final String name;
  final String createdAt;
  final String? updatedAt;

  final int? position;
  final int? decimalPrecision;
  final double? factor;

  final bool? isSystemDefault;

  final dynamic customFields;
  final dynamic translated;
}
