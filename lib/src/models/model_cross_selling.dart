import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_cross_selling_info.dart';
import 'package:flutter_shopware/src/models/model_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_cross_selling.g.dart';

@immutable
@JsonSerializable()
class CrossSelling {
  const CrossSelling(
    this.products,
    this.total,
    this.crossSelling,
  );

  factory CrossSelling.fromJson(json) => _$CrossSellingFromJson(json);

  final CrossSellingInfo crossSelling;
  final List<Element> products;
  final int total;
}
