import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_cross_selling_info.g.dart';

@immutable
@JsonSerializable()
class CrossSellingInfo {
  const CrossSellingInfo({
    this.position,
    this.limit,
    this.active,
    this.name,
    this.sortBy,
    this.sortDirection,
    this.productId,
    this.productStreamId,
    this.type,
  });

  factory CrossSellingInfo.fromJson(json) => _$CrossSellingInfoFromJson(json);

  final int? position;
  final int? limit;
  final bool? active;
  final String? name;
  final String? sortBy;
  final String? sortDirection;
  final String? productId;
  final String? productStreamId;
  final String? type;
}
