import 'package:flutter/material.dart';
import 'package:flutter_shopware/src/client_settings.dart';
import 'package:flutter_shopware/src/models/model_current_context.dart';
import 'package:flutter_shopware/src/services/service_api.dart';
import 'package:flutter_shopware/src/services/service_cart.dart';
import 'package:flutter_shopware/src/services/service_product.dart';

@immutable
abstract class Shopware {
  const Shopware._();

  static CartService cartService = const CartService();
  static ProductService productService = const ProductService();

  /// Init Shopware client with the client [settings] before accessing the services.
  static init(ClientSettings settings) async {
    APIService.client.configure = settings;
    CurrentContext context;

    // Generate a new context if not provided
    if (settings.contextToken == null) {
      context = await APIService.client.performRequest<CurrentContext>(
        RequestType.get,
        path: 'context',
        parser: CurrentContext.fromJson,
      );
    } else {
      context = CurrentContext.fromToken(settings.contextToken!);
    }
    APIService.client.currentContext = context;
  }
}
