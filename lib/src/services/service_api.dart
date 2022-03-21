import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/client_settings.dart';

enum RequestType {
  post,
  get,
  put,
  patch,
  delete,
}

class APIService {
  APIService._();

  static final APIService _instance = APIService._();
  static APIService get client => _instance;

  /// Internal HTTP client
  late final HttpClient _httpClient;

  /// The client settings for this session
  late final ClientSettings _clientSettings;
  set configure(ClientSettings settings) {
    _clientSettings = settings;
    _httpClient = HttpClient()..connectionTimeout = Duration(milliseconds: _clientSettings.timeout);
  }

  Future<void> _addHeaders(HttpClientRequest request) async {
    request.headers.contentType = ContentType('application', 'json', charset: 'utf-8');
    request.headers.add('Accept', 'application/json');
    request.headers.add('sw-access-key', _clientSettings.accessToken);
  }

  Uri _getUri(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      Uri(
        scheme: 'https',
        host: _clientSettings.endpoint,
        path: 'store-api/$path',
        queryParameters: queryParameters,
      );

  Future<T> performRequest<T>(
    RequestType type, {
    String path = '',
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    required T? Function(Map<String, dynamic>) parser,
  }) async {
    HttpClientResponse? response;
    try {
      HttpClientRequest request;
      final Uri uri = _getUri(
        path,
        queryParameters: queryParams,
      );

      switch (type) {
        case RequestType.post:
          request = await _httpClient.postUrl(uri);
          break;
        case RequestType.put:
          request = await _httpClient.putUrl(uri);
          break;
        case RequestType.get:
          request = await _httpClient.getUrl(uri);
          break;
        case RequestType.patch:
          request = await _httpClient.patchUrl(uri);
          break;
        case RequestType.delete:
          request = await _httpClient.deleteUrl(uri);
          break;
      }

      await _addHeaders(request);
      debugPrint('Requesting ${uri.toString()} | QueryParams: $queryParams | Body: $body');
      if (body != null) {
        request.write(json.encode(body));
      }

      final HttpClientResponse response = await request.close();
      final String? responseBody = await response.transform(utf8.decoder).join();

      if (responseBody != null) {
        return parser(json.decode(responseBody)) as T;
      }
    } catch (ex, s) {
      debugPrint("Request " + path + " failed. $ex headers: ${response?.headers}");
      debugPrint(s.toString());
      rethrow;
    }

    return null as T;
  }
}
