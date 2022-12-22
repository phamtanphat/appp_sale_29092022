// To parse this JSON data, do
//
//     final orderHistoryResponse = orderHistoryResponseFromJson(jsonString);

import 'dart:convert';

import 'package:appp_sale_29092022/data/model/card_response.dart';

class OrderHistoryResponse {
  OrderHistoryResponse({
    this.result,
    this.data,
  });

  final int? result;
  final List<TransactionModel>? data;

  OrderHistoryResponse copyWith({
    int? result,
    List<TransactionModel>? data,
  }) =>
      OrderHistoryResponse(
        result: result ?? this.result,
        data: data ?? this.data,
      );

  factory OrderHistoryResponse.fromRawJson(String str) =>
      OrderHistoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) =>
      OrderHistoryResponse(
        result: json["result"],
        data: List<TransactionModel>.from(
            json["data"].map((x) => TransactionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TransactionModel {
  TransactionModel({
    this.id,
    this.products,
    this.idUser,
    this.price,
    this.status,
    this.dateCreated,
    this.v,
  });

  final String? id;
  final List<CardModel>? products;
  final String? idUser;
  final int? price;
  final bool? status;
  final DateTime? dateCreated;
  final int? v;

  TransactionModel copyWith({
    String? id,
    List<CardModel>? products,
    String? idUser,
    int? price,
    bool? status,
    DateTime? dateCreated,
    int? v,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        products: products ?? this.products,
        idUser: idUser ?? this.idUser,
        price: price ?? this.price,
        status: status ?? this.status,
        dateCreated: dateCreated ?? this.dateCreated,
        v: v ?? this.v,
      );

  factory TransactionModel.fromRawJson(String str) =>
      TransactionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["_id"],
        products: List<CardModel>.from(
            json["products"].map((x) => CardModel.fromJson(x))),
        idUser: json["id_user"],
        price: json["price"],
        status: json["status"],
        dateCreated: DateTime.parse(json["date_created"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "id_user": idUser,
        "price": price,
        "status": status,
        "date_created": dateCreated!.toIso8601String(),
        "__v": v,
      };
}
