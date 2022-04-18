import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_price.g.dart';

enum TaxStatus {
  gross,
  net,
  taxfree,
}

TaxStatus? _taxStatusFromJson(String? value) =>
    value == null ? null : TaxStatus.values.singleWhere((tax) => tax.name == value.replaceAll('-', ''));

@immutable
@JsonSerializable()
class Price {
  const Price(
    this.netPrice,
    this.totalPrice,
    this.positionPrice,
    this.taxStatus,
    this.max,
    this.min,
  );

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  final double? netPrice;
  final double? totalPrice;
  final double? positionPrice;
  final int? max;
  final int? min;

  @JsonKey(fromJson: _taxStatusFromJson)
  final TaxStatus? taxStatus;
}
