import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_cart_update.dart';
import 'package:flutter_shopware/src/services/service_api.dart';

import '../models/model_cart.dart';

@immutable
class CartService {
  const CartService();

  /// Fetches the current cart
  Future<Cart?> getCart() async {
    return await APIService.client.performRequest<Cart?>(
      RequestType.get,
      path: 'checkout/cart',
      parser: Cart.fromJson,
    );
  }

  /// Adds items to the cart. An item can be a product or promotion for example.
  /// They are referenced by the referencedId-parameter.
  Future<Cart?> updateCart(CartUpdate cart) async {
    return await APIService.client.performRequest<Cart?>(
      RequestType.post,
      path: 'checkout/cart/line-item',
      body: cart.toJson(),
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
