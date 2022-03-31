import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'model_context.dart';
import 'model_currency.dart';
import 'model_customer_group.dart';
import 'model_payment_method.dart';
import 'model_sales_channel.dart';
import 'model_tax_rule.dart';

part 'model_current_context.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class CurrentContext {
  const CurrentContext({
    this.apiAlias,
    this.token,
    this.currentCustomerGroup,
    this.fallbackCustomerGroup,
    this.currency,
    this.salesChannel,
    this.taxRules,
    this.customer,
    this.paymentMethod,
    this.shippingMethod,
    this.context,
  });

  factory CurrentContext.fromJson(Map<String, dynamic> json) => _$CurrentContextFromJson(json);
  factory CurrentContext.fromToken(String token) => CurrentContext(token: token);

  final String? apiAlias;
  final String? token;
  final Currency? currency;
  final SalesChannel? salesChannel;
  final List<TaxRule>? taxRules;
  final dynamic customer;
  final dynamic shippingMethod;
  final PaymentMethod? paymentMethod;
  final CustomerGroup? currentCustomerGroup;
  final CustomerGroup? fallbackCustomerGroup;
  final Context? context;
}
