import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:flutter_shopware/src/client_settings.dart';
import 'package:flutter_shopware/src/models/model_cart_update.dart';
import 'package:flutter_shopware/src/models/model_product.dart';
import 'package:flutter_shopware/src/models/model_product_search.dart';
import 'package:flutter_shopware/src/models/model_products.dart';
import 'package:flutter_shopware/src/services/service_cart.dart';
import 'package:flutter_shopware/src/services/service_product.dart';
import 'package:flutter_shopware/src/shopware.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_constants.dart';

void main() {
  setUpAll(() async {
    await Shopware.init(
      const ClientSettings(
        accessToken: 'SWSCAFF0N3PIZVJSM0U4UXBDYW',
        endpoint: 'dev-pcs.sw.hypnotic.agency',
      ),
    );
  });

  group('Cart service', () {
    final CartService cartService = Shopware.cartService;

    test('creates a new cart with name "test"', () async {
      Cart? cart = await cartService.getCart(name: 'test');

      expect(cart, isNotNull);
      expect(cart!.name, 'test');
      expect(cart.lineItems, isEmpty);
      expect(cart.errors, isEmpty);
      expect(cart.token, isNotNull);
      expect(cart.token, isNotEmpty);
    });
    test('fetches cart', () async {
      Cart? cart = await cartService.getCart();
      expect(cart, isNotNull);
    });

    test('adds item to the cart', () async {
      //TODO: Replace with dynamic items from the shop
      const CartUpdate cartUpdate = CartUpdate(items: [
        LineItem(
          id: demoProductId1,
          referencedId: demoProductId1,
          quantity: 1,
          type: 'product',
        ),
        LineItem(
          id: demoProductId2,
          referencedId: demoProductId2,
          quantity: 1,
          type: 'product',
        ),
      ]);

      Cart? cart = await cartService.addItemsToCart(cartUpdate);
      LineItem? lineItem1 = cart?.lineItems.singleWhere((item) => item.referencedId == demoProductId1);
      LineItem? lineItem2 = cart?.lineItems.singleWhere((item) => item.referencedId == demoProductId2);

      expect(cart, isNotNull);
      expect(lineItem1, isNotNull);
      expect(lineItem2, isNotNull);
    });

    test('updates the quantity of the previous items from the cart', () async {
      //TODO: Replace with dynamic items from the shop
      const CartUpdate cartUpdate = CartUpdate(items: [
        LineItem(
          id: demoProductId1,
          quantity: 2,
        ),
        LineItem(
          id: demoProductId2,
          quantity: 2,
        ),
      ]);

      Cart? cart = await cartService.updateCart(cartUpdate);
      LineItem? lineItem1 = cart?.lineItems.singleWhere((item) => item.referencedId == demoProductId1);
      LineItem? lineItem2 = cart?.lineItems.singleWhere((item) => item.referencedId == demoProductId2);

      expect(cart, isNotNull);
      expect(cart!.lineItems, isNotEmpty);
      expect(lineItem1!.quantity, equals(2));
      expect(lineItem2!.quantity, equals(2));
    });

    test('removes the previous added items from the cart', () async {
      Cart? cart = await cartService.removeItemsFromCart([demoProductId1, demoProductId2]);

      expect(cart, isNotNull);
      expect(cart!.lineItems, isEmpty);
    });

    test('deletes the current cart', () async {
      bool result = await cartService.deleteCart();
      expect(result, isTrue);
    });
  });

  group('Products service', () {
    final ProductService productService = Shopware.productService;

    test('fetches a default list of products', () async {
      Products? products = await productService.listOfProducts();

      expect(products, isNotNull);
      expect(products!.entity, 'product');
      expect(products.limit, 100);
      expect(products.elements, isNotEmpty);
    });

    test('fetches a list of 50 limit products', () async {
      Products? products = await productService.listOfProducts(query: const ProductSearch(limit: 50));

      expect(products, isNotNull);
      expect(products!.entity, 'product');
      expect(products.limit, 50);
      expect(products.elements, isNotEmpty);
    });

    test('fetches a single product', () async {
      Product? products = await productService.singleProduct(demoProductId1);

      expect(products, isNotNull);
      expect(products!.product.id, demoProductId1);
    });
  });
}
