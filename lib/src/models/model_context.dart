import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_context.g.dart';

@immutable
@JsonSerializable()
class Context {
  const Context({
    this.versionId,
    this.currencyId,
    this.scope,
    this.source,
    this.taxState,
    this.currencyFactor,
    this.currencyPrecision,
    this.useCache,
  });

  factory Context.fromJson(Map<String, dynamic> json) => _$ContextFromJson(json);

  final String? versionId;
  final String? currencyId;
  final String? scope;
  final String? taxState;
  final double? currencyFactor;
  final int? currencyPrecision;
  final bool? useCache;
  final dynamic source;
}
