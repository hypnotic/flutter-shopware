import 'package:flutter/material.dart';
import 'package:flutter_shopware/src/client_settings.dart';
import 'package:flutter_shopware/src/services/service_api.dart';
import 'package:flutter_shopware/src/services/service_cart.dart';

@immutable
abstract class Shopware {
  const Shopware._();

  static CartService cartService = const CartService();

  /// Init Shopware client with the client [settings] before accessing the services.
  static init(ClientSettings settings) => APIService.client.configure = settings;
}
