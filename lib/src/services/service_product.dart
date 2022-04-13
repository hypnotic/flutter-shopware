import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_product.dart';
import 'package:flutter_shopware/src/models/model_product_search.dart';
import 'package:flutter_shopware/src/models/model_products.dart';
import 'package:flutter_shopware/src/services/service_api.dart';

@immutable
class ProductService {
  const ProductService();

  /// List products that match the given criteria. For performance ressons a limit should always be set.
  /// Optionally, a [query] can be provided.
  Future<Products?> listOfProducts({ProductSearch? query}) async {
    return await APIService.client.performRequest<Products?>(
      RequestType.post,
      path: 'product',
      body: query?.toJson(),
      parser: Products.fromJson,
    );
  }

  /// This route is used to load a single product with the corresponding details.
  /// In addition to loading the data, the best variant of the product is determined when a parent id is passed.
  Future<Product?> singleProduct(String productId) async {
    return await APIService.client.performRequest<Product>(
      RequestType.post,
      path: 'product/$productId',
      parser: Product.fromJson,
    );
  }
}
