import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_media.g.dart';

@immutable
@JsonSerializable()
class Media {
  const Media({
    required this.createdAt,
    this.id,
    this.mimeType,
    this.fileExtension,
    this.fileName,
    this.alt,
    this.title,
    this.url,
    this.hasFile,
    this.private,
    this.fileSize,
    this.metaData,
    this.updatedAt,
    this.customFields,
    this.translated,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  final String? id;
  final String? mimeType;
  final String? fileExtension;
  final String? fileName;
  final String? alt;
  final String? title;
  final String? url;
  final String createdAt;
  final String? updatedAt;

  final bool? hasFile;
  final bool? private;
  final int? fileSize;

  final dynamic customFields;
  final dynamic metaData;
  final dynamic translated;
}
