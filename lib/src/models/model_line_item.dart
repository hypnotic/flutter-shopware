import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_line_item.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class LineItem {
  const LineItem({
    required this.id,
    required this.quantity,
    this.type,
    this.referencedId,
    this.label,
    this.description,
    this.removable,
    this.stackable,
    this.modified,
    this.good,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => _$LineItemFromJson(json);
  Map<String, dynamic> toJson() => _$LineItemToJson(this);

  final String id;
  final String? referencedId;
  final String? label;
  final String? description;
  final String? type;
  final bool? removable;
  final bool? stackable;
  final bool? modified;
  final bool? good;
  final int quantity;
}
