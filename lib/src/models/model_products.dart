import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_products.g.dart';

@immutable
@JsonSerializable()
class Products {
  const Products({
    this.apiAlias,
    this.entity,
    this.total,
    this.page,
    this.limit,
    this.aggregations,
    this.elements,
  });

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

  final String? apiAlias;
  final String? entity;
  final int? total;
  final int? page;
  final int? limit;
  final List? aggregations;
  final List<Element>? elements;
}
