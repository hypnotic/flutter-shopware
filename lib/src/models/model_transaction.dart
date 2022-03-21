import 'package:flutter/foundation.dart';
import 'package:flutter_shopware/flutter_shopware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_transaction.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class Transaction extends Entity {
  const Transaction(
    this.paymentMethodId,
  );

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  final String paymentMethodId;
}
