import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_cart_update.dart';
import 'package:flutter_shopware/src/services/service_api.dart';

import '../models/model_cart.dart';

@immutable
class CartService {
  const CartService();

  /// Fetches or creates a new cart.
  /// Provide the [name] of the new cart. This parameter will only be used when creating a new cart.
  Future<Cart?> getCart({String? name}) async {
    return await APIService.client.performRequest<Cart?>(
      RequestType.get,
      path: 'checkout/cart',
      queryParams: {'name': name},
      parser: Cart.fromJson,
    );
  }

  /// Adds items to the cart. An item can be a product or promotion for example.
  /// They are referenced by the referencedId-parameter.
  Future<Cart?> addItemsToCart(CartUpdate cart) async {
    return await APIService.client.performRequest<Cart?>(
      RequestType.post,
      path: 'checkout/cart/line-item',
      body: cart.toJson(),
      parser: Cart.fromJson,
    );
  }

  /// Updates the cart. Typically to update the quantities of the items.
  Future<Cart?> updateCart(CartUpdate cart) async {
    return await APIService.client.performRequest<Cart?>(
      RequestType.patch,
      path: 'checkout/cart/line-item',
      body: cart.toJson(),
      parser: Cart.fromJson,
    );
  }

  /// Removes the [ids] items from the cart and returns an updated `Cart`
  Future<Cart?> removeItemsFromCart(List<String> ids) async {
    return await APIService.client.performRequest<Cart?>(
      RequestType.delete,
      path: 'checkout/cart/line-item',
      queryParams: {'ids[]': ids},
      parser: Cart.fromJson,
    );
  }

  /// Deletes the current cart, by removing all items
  Future<bool> deleteCart() async {
    return await APIService.client.performRequest<bool>(
      RequestType.delete,
      path: 'checkout/cart',
    );
  }
}
