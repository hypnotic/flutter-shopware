import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_login_data.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class LoginData {
  const LoginData({
    required this.username,
    required this.password,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);

  final String username;
  final String password;
}
