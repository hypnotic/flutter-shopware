import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:flutter_shopware/src/client_settings.dart';
import 'package:flutter_shopware/src/models/model_cart_update.dart';
import 'package:flutter_shopware/src/services/service_cart.dart';
import 'package:flutter_shopware/src/shopware.dart';
import 'package:flutter_test/flutter_test.dart';

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
    test('fetches cart', () async {
      Cart? cart = await cartService.getCart();
      expect(cart, isNotNull);
    });

    test('adds item to the cart', () async {
      const CartUpdate cartUpdate = CartUpdate(items: [
        LineItem(
          id: '36f4320411d74d9ea9b69bd932525cb7',
          referencedId: '36f4320411d74d9ea9b69bd932525cb7',
          quantity: 1,
          type: 'product',
        )
      ]);

      Cart? cart = await cartService.updateCart(cartUpdate);
      LineItem? lineItem = cart?.lineItems.singleWhere((item) => item.referencedId == '36f4320411d74d9ea9b69bd932525cb7');

      expect(cart, isNotNull);
      expect(lineItem, isNotNull);
    });

    test('deletes the current cart', () async {
      bool result = await cartService.deleteCart();
      expect(result, isTrue);
    });

    test('creates a new cart with name "test"', () async {
      Cart? cart = await cartService.getCart(name: 'test');

      expect(cart, isNotNull);
      expect(cart!.name, 'test');
      expect(cart.lineItems, isEmpty);
      expect(cart.errors, isEmpty);
      expect(cart.token, isNotNull);
      expect(cart.token, isNotEmpty);
    });
  });
}
