import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_product.g.dart';

@immutable
@JsonSerializable()
class Product {
  const Product(
    this.product,
    this.configurator,
  );

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  final Element product;
  final List<dynamic> configurator;
}
