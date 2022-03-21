import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_cart.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class Cart extends Entity {
  const Cart(
    this.apiAlias,
    this.name,
    this.token,
    this.price,
    this.lineItems,
    this.errors,
    this.transactions,
    this.modified,
    this.customerComment,
    this.affiliateCode,
    this.campaignCode,
  );

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  final String apiAlias;
  final String name;
  final String token;
  final Price price;
  final List<LineItem> lineItems;
  final List<GenericError> errors;
  final List<Transaction> transactions;
  final bool modified;
  final String? customerComment;
  final String? affiliateCode;
  final String? campaignCode;
}
