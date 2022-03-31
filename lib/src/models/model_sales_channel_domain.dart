import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_currency.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_sales_channel_domain.g.dart';

@immutable
@JsonSerializable()
class SalesChannelDomain {
  const SalesChannelDomain({
    required this.createdAt,
    required this.currencyId,
    required this.languageId,
    required this.salesChannelId,
    required this.snippetSetId,
    required this.url,
    this.updatedAt,
    this.id,
    this.currency,
    this.hreflangUseOnlyLocale,
    this.customFields,
    this.language,
    this.salesChannelDefaultHreflang,
  });

  factory SalesChannelDomain.fromJson(Map<String, dynamic> json) => _$SalesChannelDomainFromJson(json);

  final String createdAt;
  final String currencyId;
  final String? id;
  final String languageId;
  final String salesChannelId;
  final String snippetSetId;
  final String? updatedAt;
  final String url;

  final Currency? currency;
  final bool? hreflangUseOnlyLocale;
  final dynamic customFields;
  //TODO
  final dynamic language;
  final dynamic salesChannelDefaultHreflang;
}
