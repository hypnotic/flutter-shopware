import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_sort.dart';
import 'package:json_annotation/json_annotation.dart';

import 'model_filter.dart';

part 'model_product_search.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class ProductSearch {
  const ProductSearch({
    this.order,
    this.p,
    this.rating,
    this.manufacturer,
    this.properties,
    this.propertyWhitelist,
    this.reduceAggregations,
    this.minPrice,
    this.maxPrice,
    this.shippingFree,
    this.manufacturerFilter,
    this.ratingFiler,
    this.shippingFreeFilter,
    this.propertyFilter,
    this.page,
    this.limit,
    this.filter,
    this.sort,
    this.postFilder,
    this.associations,
    this.aggregations,
    this.grouping,
  });

  factory ProductSearch.fromJson(Map<String, dynamic> json) => _$ProductSearchFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSearchToJson(this);

  final int? page;
  final int? limit;
  final List<Filter>? filter;
  final List<Sort>? sort;
  final List<Filter>? aggregations;
  final List<String>? grouping;
  final dynamic associations;
  final String? order;
  final int? p;
  final int? rating;
  final String? manufacturer;
  final String? properties;

  @JsonKey(name: 'property-whitelist')
  final String? propertyWhitelist;

  @JsonKey(name: 'reduce-aggregations')
  final String? reduceAggregations;

  @JsonKey(name: 'min-price')
  final int? minPrice;

  @JsonKey(name: 'max-price')
  final int? maxPrice;

  @JsonKey(name: 'post-filter')
  final List<Filter>? postFilder;

  @JsonKey(name: 'shipping-free', defaultValue: false)
  final bool? shippingFree;

  @JsonKey(name: 'manufacturer-filter', defaultValue: true)
  final bool? manufacturerFilter;

  @JsonKey(name: 'rating-filter', defaultValue: true)
  final bool? ratingFiler;

  @JsonKey(name: 'shipping-free-filter', defaultValue: true)
  final bool? shippingFreeFilter;

  @JsonKey(name: 'property-filter', defaultValue: true)
  final bool? propertyFilter;
}
