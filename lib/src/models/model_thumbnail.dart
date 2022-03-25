import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_thumbnail.g.dart';

@immutable
@JsonSerializable()
class Thumbnail {
  const Thumbnail({
    required this.mediaId,
    required this.width,
    required this.height,
    required this.createdAt,
    this.id,
    this.url,
    this.updatedAt,
    this.customFields,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);

  final String? id;
  final String mediaId;
  final int width;
  final int height;
  final String? url;
  final String createdAt;
  final String? updatedAt;
  final dynamic customFields;
}
