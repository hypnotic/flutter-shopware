import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_line_item.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class LineItem extends Entity {
  const LineItem(
    this.id,
    this.referecedId,
    this.label,
    this.description,
    this.type,
    this.removable,
    this.stackable,
    this.modified,
    this.good,
    this.quantity,
  );

  factory LineItem.fromJson(Map<String, dynamic> json) => _$LineItemFromJson(json);

  final String id;
  final String referecedId;
  final String label;
  final String description;
  final String type;
  final bool removable;
  final bool stackable;
  final bool modified;
  final bool good;
  final int quantity;
}
