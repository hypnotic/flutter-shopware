import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/services/service_api.dart';

import '../models/model_cart.dart';

@immutable
class CartService {
  const CartService();

  /// Fetches the current cart
  Future<Cart> getCart() async {
    return await APIService.client.performRequest<Cart>(
      RequestType.get,
      path: 'checkout/cart',
      parser: Cart.fromJson,
    );
  }
}
