import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_price.g.dart';

enum TaxStatus {
  gross,
  net,
  taxfree,
}

TaxStatus _taxStatusFromJson(String value) => TaxStatus.values.singleWhere((tax) => tax.name == value.replaceAll('-', ''));

@immutable
@JsonSerializable(createToJson: false)
class Price extends Entity {
  const Price(
    this.netPrice,
    this.totalPrice,
    this.positionPrice,
    this.taxStatus,
  );

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  final double netPrice;
  final double totalPrice;
  final double positionPrice;

  @JsonKey(fromJson: _taxStatusFromJson)
  final TaxStatus taxStatus;
}
