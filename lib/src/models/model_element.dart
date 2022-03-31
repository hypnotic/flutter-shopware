import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_element.g.dart';

@immutable
@JsonSerializable()
class Element {
  const Element({
    required this.taxId,
    required this.createdAt,
    required this.productNumber,
    this.name,
    this.id,
    this.versionId,
    this.parentId,
    this.parentVersionId,
    this.manufacturedId,
    this.productManufacterVersionId,
    this.unitId,
    this.coverId,
    this.productMediaVersionId,
    this.deliveryTimeId,
    this.canonicalProductId,
    this.cmsPageId,
    this.cmsPageVersionId,
    this.stock,
    this.restockTime,
    this.active,
    this.availableStock,
    this.available,
    this.isCloseout,
    this.displayGroup,
    this.mainVariantId,
    this.manufacturerNumber,
    this.ean,
    this.purchaseSteps,
    this.maxPurchase,
    this.minPurchase,
    this.purchaseUnit,
    this.referenceUnit,
    this.shippingFree,
    this.markAsTopseller,
    this.weight,
    this.width,
    this.height,
    this.length,
    this.releaseDate,
    this.ratingAverage,
    this.categoryTree,
    this.propertyIds,
    this.optionIds,
    this.categoryIds,
    this.childCount,
    this.sales,
    this.metaDescription,
    this.keywords,
    this.description,
    this.metaTitle,
    this.packUnit,
    this.packUnitPlural,
    this.customFields,
    this.calculatedPrice,
    this.calculatedPrices,
    this.calculatedMaxPurchase,
    this.calculatedChapestPrice,
    this.isNew,
    this.updatedAt,
    this.translated,
    this.parent,
    this.children,
    this.deliveryTime,
    this.tax,
    this.manufacturer,
    this.unit,
    this.cover,
    this.cmsPage,
    this.canonicalProduct,
    this.media,
    this.crossSellings,
    this.configuratorSettings,
    this.productReviews,
    this.mainCategories,
    this.seoUrls,
    this.options,
    this.properties,
    this.categories,
    this.streams,
    this.categoriesRo,
    this.seoCategory,
  });

  factory Element.fromJson(Map<String, dynamic> json) => _$ElementFromJson(json);

  final String? id;
  final String? versionId;
  final String? parentId;
  final String? parentVersionId;
  final String? manufacturedId;
  final String? productManufacterVersionId;
  final String? unitId;
  final String taxId;
  final String? coverId;
  final String? productMediaVersionId;
  final String? deliveryTimeId;
  final String? canonicalProductId;
  final String? cmsPageId;
  final String? cmsPageVersionId;
  final String productNumber;
  final int? stock;
  final int? restockTime;
  final bool? active;
  final int? availableStock;
  final bool? available;
  final bool? isCloseout;
  final String? displayGroup;
  final String? mainVariantId;
  final String? manufacturerNumber;
  final String? ean;
  final int? purchaseSteps;
  final int? maxPurchase;
  final int? minPurchase;
  final int? purchaseUnit;
  final int? referenceUnit;
  final bool? shippingFree;
  final bool? markAsTopseller;
  final int? weight;
  final int? width;
  final int? height;
  final int? length;
  final String? releaseDate;
  final double? ratingAverage;
  final List<String>? categoryTree;
  final List<String>? propertyIds;
  final List<String>? optionIds;
  final List<String>? categoryIds;
  final int? childCount;
  final int? sales;
  final String? metaDescription;
  final String? name;
  final String? keywords;
  final String? description;
  final String? metaTitle;
  final String? packUnit;
  final String? packUnitPlural;
  final dynamic customFields;
  final dynamic calculatedPrice;
  final List? calculatedPrices;
  final int? calculatedMaxPurchase;
  final dynamic calculatedChapestPrice;
  final bool? isNew;
  final String createdAt;
  final String? updatedAt;
  final dynamic translated;
  final Element? parent;
  final List<Element>? children;
  final dynamic deliveryTime;
  final dynamic tax;
  final dynamic manufacturer;
  final dynamic unit;
  final dynamic cover;
  final dynamic cmsPage;
  final Element? canonicalProduct;
  final dynamic media;
  final dynamic crossSellings;
  final dynamic configuratorSettings;
  final dynamic productReviews;
  final dynamic mainCategories;
  final dynamic seoUrls;
  final dynamic options;
  final dynamic properties;
  final dynamic categories;
  final dynamic streams;
  final dynamic categoriesRo;
  final dynamic seoCategory;
}
