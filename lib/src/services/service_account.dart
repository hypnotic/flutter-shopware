import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/src/models/model_current_context.dart';
import 'package:flutter_shopware/src/models/model_login_data.dart';
import 'package:flutter_shopware/src/services/service_api.dart';

@immutable
class AccountService {
  const AccountService();

  /// Logs in customers given their credentials and updates the sw-context-token for subsquent requests.
  /// Returns `true` if login has succeed.
  Future<bool> login(LoginData loginData) async {
    String? contexToken = await APIService.client.performRequest<String?, MapData>(
      RequestType.post,
      path: 'account/login',
      body: loginData.toJson(),
      parser: (data) => data['contextToken'],
    );

    if (contexToken != null) {
      APIService.client.currentContext = CurrentContext.fromToken(contexToken);
      return true;
    }
    return false;
  }
}
