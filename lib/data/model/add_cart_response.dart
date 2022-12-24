import 'dart:convert';
import 'package:appp_sale_29092022/data/model/order_history_response.dart';

class AddCartResponse {
  AddCartResponse({
    this.result,
    this.data,
    this.message,
  });

  final int? result;
  final TransactionModel? data;
  final String? message;

  AddCartResponse copyWith({
    int? result,
    TransactionModel? data,
    String? message,
  }) =>
      AddCartResponse(
        result: result ?? this.result,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddCartResponse.fromRawJson(String str) =>
      AddCartResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddCartResponse.fromJson(Map<String, dynamic> json) =>
      AddCartResponse(
        result: json["result"],
        data: TransactionModel.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": data!.toJson(),
        "message": message,
      };
}
