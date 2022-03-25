import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_cart.g.dart';

@immutable
@JsonSerializable()
class Cart {
  const Cart({
    required this.apiAlias,
    required this.name,
    required this.token,
    required this.price,
    required this.lineItems,
    required this.errors,
    required this.transactions,
    required this.modified,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.translated,
    this.customFields,
    this.extensions,
    this.customerComment,
    this.affiliateCode,
    this.campaignCode,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  final String? createdAt;
  final String? id;
  final String? updatedAt;
  final String apiAlias;
  final String name;
  final String token;
  final String? customerComment;
  final String? affiliateCode;
  final String? campaignCode;

  final Price price;
  final bool modified;

  final List<LineItem> lineItems;
  final List<GenericError> errors;
  final List<Transaction> transactions;

  final dynamic translated;
  final dynamic customFields;
  final dynamic extensions;
}
