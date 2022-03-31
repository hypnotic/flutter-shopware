import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_payment_method.g.dart';

@immutable
@JsonSerializable()
class PaymentMethod {
  const PaymentMethod({
    required this.name,
    required this.createdAt,
    this.distinguishableName,
    this.description,
    this.mediaId,
    this.position,
    this.active,
    this.afterOrderEnabled,
    this.id,
    this.media,
    this.extensions,
    this.updatedAt,
    this.customFields,
    this.translated,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

  final String? id;
  final String name;
  final String? distinguishableName;
  final String? description;
  final String? mediaId;
  final int? position;

  final bool? active;
  final bool? afterOrderEnabled;
  final Media? media;

  final DateTime createdAt;
  final DateTime? updatedAt;

  final dynamic translated;
  final dynamic customFields;
  final dynamic extensions;
}
