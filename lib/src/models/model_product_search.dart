import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_sort.dart';
import 'package:json_annotation/json_annotation.dart';

import 'model_filter.dart';

part 'model_product_search.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class ProductSearch {
  const ProductSearch({
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

  @JsonKey(name: 'post-filter')
  final List<Filter>? postFilder;
}
