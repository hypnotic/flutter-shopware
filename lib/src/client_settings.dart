import 'package:flutter/foundation.dart';

@immutable
class ClientSettings {
  const ClientSettings({
    required this.endpoint,
    required this.accessToken,
    this.contextToken,
    this.languageId,
    this.defaultPaginationLimit = 10,
    this.timeout = 10000,
  });

  /// Shopware URL
  final String endpoint;

  /// Specific ID for each sales channel
  final String accessToken;

  /// Session id
  final String? contextToken;

  /// Language ID
  final String? languageId;

  /// Number of products per page. Defaults to 10.
  final int defaultPaginationLimit;

  /// Request timeout (ms). Defaults to 10000.
  final int timeout;
}
