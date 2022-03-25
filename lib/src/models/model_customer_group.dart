import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_customer_group.g.dart';

@immutable
@JsonSerializable()
class CustomerGroup {
  const CustomerGroup({
    required this.name,
    required this.createdAt,
    this.id,
    this.updatedAt,
    this.translated,
    this.customFields,
    this.extensions,
    this.displayGross,
    this.registrationActive,
    this.registrationTitle,
    this.registrationIntroduction,
    this.registrationOnlyCompanyRegistration,
    this.registrationSeoMetaDescription,
    this.uniqueIdentifier,
    this.versionId,
    this.apiAlias,
  });

  factory CustomerGroup.fromJson(Map<String, dynamic> json) => _$CustomerGroupFromJson(json);

  final String? id;
  final String? apiAlias;
  final String name;
  final String? registrationTitle;
  final String? registrationIntroduction;
  final String? registrationSeoMetaDescription;
  final String? uniqueIdentifier;
  final String? versionId;

  final bool? displayGross;
  final bool? registrationActive;
  final bool? registrationOnlyCompanyRegistration;

  final DateTime createdAt;
  final DateTime? updatedAt;

  final dynamic translated;
  final dynamic customFields;
  final dynamic extensions;
}
