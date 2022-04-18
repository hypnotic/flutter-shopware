import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_filter_state.g.dart';

@immutable
@JsonSerializable()
class FilterState {
  const FilterState({
    this.navigationId,
    this.manufacturer,
    this.price,
    this.rating,
    this.properties,
    this.shippingFree,
  });

  factory FilterState.fromJson(Map<String, dynamic> json) => _$FilterStateFromJson(json);

  final String? navigationId;
  final List? manufacturer;
  final Price? price;
  final int? rating;
  final List? properties;

  @JsonKey(name: 'shipping-free')
  final bool? shippingFree;
}
