import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_cross_selling.dart';
import 'package:flutter_shopware/src/models/model_product.dart';
import 'package:flutter_shopware/src/models/model_product_search.dart';
import 'package:flutter_shopware/src/models/model_products.dart';
import 'package:flutter_shopware/src/models/model_review.dart';
import 'package:flutter_shopware/src/services/service_api.dart';

@immutable
class ProductService {
  const ProductService();

  /// List products that match the given criteria. For performance ressons a limit should always be set.
  /// Optionally, a [query] can be provided.
  Future<Products?> listOfProducts({ProductSearch? query}) async {
    return await APIService.client.performRequest<Products?, MapData>(
      RequestType.post,
      path: 'product',
      body: query?.toJson(),
      parser: Products.fromJson,
    );
  }

  /// This route is used to load a single product with the corresponding details.
  /// In addition to loading the data, the best variant of the product is determined when a parent id is passed.
  Future<Product?> singleProduct(String productId) async {
    return await APIService.client.performRequest<Product, MapData>(
      RequestType.post,
      path: 'product/$productId',
      parser: Product.fromJson,
    );
  }

  /// This route is used to load the cross sellings for a product.
  /// A product has several cross selling definitions in which several products are linked.
  /// The route returns the cross sellings together with the linked products.
  Future<List<CrossSelling>?> crossSellingGroups(String productId) async {
    return await APIService.client.performRequest<List<CrossSelling>, ListData>(
      RequestType.post,
      path: 'product/$productId/cross-selling',
      parser: (data) => data.map((x) => CrossSelling.fromJson(x)).toList(),
    );
  }

  /// Fetches a product listing for a specific [categoryId].
  /// It also provides filters, sortings and property aggregations, analogous to the /search endpoint through [search].
  Future<Products?> productsByCategory(String categoryId, [ProductSearch? search]) async {
    return await APIService.client.performRequest<Products, MapData>(
      RequestType.post,
      path: 'product-listing/$categoryId',
      body: search?.toJson(),
      parser: Products.fromJson,
    );
  }

  /// Perform a filtered search for [productId] reviews based on [search].
  Future<Products?> reviews(String productId, [ProductSearch? search]) async {
    return await APIService.client.performRequest<Products, MapData>(
      RequestType.post,
      path: 'product/$productId/reviews',
      body: search?.toJson(),
      parser: Products.fromJson,
    );
  }

  /// Saves a [review] for a [productId].
  Future<bool> saveReview({required String productId, required Review review}) async {
    return await APIService.client.performRequest<bool, bool>(
      RequestType.post,
      path: 'product/$productId/review',
      body: review.toJson(),
    );
  }
}
