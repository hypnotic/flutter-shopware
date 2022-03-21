import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:flutter_shopware/src/client_settings.dart';
import 'package:flutter_shopware/src/shopware.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    Shopware.init(
      const ClientSettings(
        accessToken: 'SWSCZW5JYTE2UUOZDG9IWFQ3DQ',
        endpoint: 'dev-pcs.sw.hypnotic.agency',
      ),
    );
  });

  group('Cart service', () {
    test('fetches cart', () async {
      Cart cart = await Shopware.cartService.getCart();
      expect(cart, isNotNull);
    });
  });
}
