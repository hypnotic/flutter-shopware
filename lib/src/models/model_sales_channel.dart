import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_currency.dart';
import 'package:flutter_shopware/src/models/model_payment_method.dart';
import 'package:flutter_shopware/src/models/model_sales_channel_domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_sales_channel.g.dart';

@immutable
@JsonSerializable()
class SalesChannel {
  const SalesChannel({
    required this.name,
    required this.currencyId,
    required this.customerGroupId,
    required this.languageId,
    required this.navigationCategoryId,
    required this.paymentMethodId,
    required this.shippingMethodId,
    required this.createdAt,
    required this.countryId,
    this.shortName,
    this.taxCalculationType,
    this.active,
    this.configuration,
    this.translated,
    this.updated,
    this.id,
    this.domains,
    this.country,
    this.currency,
    this.customFields,
    this.footerCategory,
    this.footerCategoryId,
    this.footerCategoryVersionId,
    this.hreflangActive,
    this.hreflangDefaultDomain,
    this.hreflangDefaultDomainId,
    this.language,
    this.mailHeaderFooterId,
    this.maintenance,
    this.navigationCategory,
    this.navigationCategoryDepth,
    this.navigationCategoryVersionId,
    this.paymentMethod,
    this.serviceCategory,
    this.serviceCategoryId,
    this.serviceCategoryVersionId,
    this.shippingMethod,
  });

  factory SalesChannel.fromJson(Map<String, dynamic> json) => _$SalesChannelFromJson(json);

  final String name;
  final String? shortName;
  final String? taxCalculationType;
  final bool? active;
  final dynamic configuration;
  final dynamic translated;
  final String? updated;
  final String createdAt;
  final String? id;
  final List<SalesChannelDomain>? domains;

  // Country
  final dynamic country;
  final String countryId;

  // Currency
  final Currency? currency;
  final String currencyId;
  final dynamic customFields;
  final String customerGroupId;

  // Footer
  final dynamic footerCategory;
  final String? footerCategoryId;
  final String? footerCategoryVersionId;

  // Hreflang
  final bool? hreflangActive;
  final dynamic hreflangDefaultDomain;
  final String? hreflangDefaultDomainId;

  // Language
  final dynamic language;
  final String languageId;

  final String? mailHeaderFooterId;
  final bool? maintenance;

  // Navigation
  final dynamic navigationCategory;
  final int? navigationCategoryDepth;
  final String navigationCategoryId;
  final String? navigationCategoryVersionId;

  // Payment
  final PaymentMethod? paymentMethod;
  final String paymentMethodId;

  // Service category
  final String? serviceCategory;
  final String? serviceCategoryId;
  final String? serviceCategoryVersionId;

  // Shipping
  final dynamic shippingMethod;
  final String shippingMethodId;
}
