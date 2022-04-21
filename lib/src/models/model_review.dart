import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_review.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class Review {
  const Review({
    this.name,
    this.email,
    required this.title,
    required this.content,
    required this.points,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  final String? name;
  final String? email;
  final String title;
  final String content;
  final double points;
}
