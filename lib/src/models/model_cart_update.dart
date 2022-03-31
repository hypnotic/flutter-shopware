import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_cart_update.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class CartUpdate {
  const CartUpdate({
    required this.items,
    this.apiAlias,
  });

  factory CartUpdate.fromJson(Map<String, dynamic> json) => _$CartUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$CartUpdateToJson(this);

  final String? apiAlias;
  final List<LineItem> items;
}
