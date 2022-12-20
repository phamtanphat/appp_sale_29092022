// To parse this JSON data, do
//
//     final cardResponse = cardResponseFromJson(jsonString);

import 'dart:convert';

class CardResponse {
  CardResponse({
    this.result,
    this.data,
  });

  final int? result;
  final List<CardModel>? data;

  CardResponse copyWith({
    int? result,
    List<CardModel>? data,
  }) =>
      CardResponse(
        result: result ?? this.result,
        data: data ?? this.data,
      );

  factory CardResponse.fromRawJson(String str) =>
      CardResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardResponse.fromJson(Map<String, dynamic> json) => CardResponse(
        result: json["result"],
        data: List<CardModel>.from(
            json["data"].map((x) => CardModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CardModel {
  CardModel({
    this.id,
    this.name,
    this.address,
    this.price,
    this.img,
    this.quantity,
    this.gallery,
    this.dateCreated,
    this.dateUpdated,
    this.v,
  });

  final String? id;
  final String? name;
  final String? address;
  final int? price;
  final String? img;
  final int? quantity;
  final List<String>? gallery;
  final DateTime? dateCreated;
  final dynamic dateUpdated;
  final int? v;

  CardModel copyWith({
    String? id,
    String? name,
    String? address,
    int? price,
    String? img,
    int? quantity,
    List<String>? gallery,
    DateTime? dateCreated,
    dynamic dateUpdated,
    int? v,
  }) =>
      CardModel(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        price: price ?? this.price,
        img: img ?? this.img,
        quantity: quantity ?? this.quantity,
        gallery: gallery ?? this.gallery,
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        v: v ?? this.v,
      );

  factory CardModel.fromRawJson(String str) =>
      CardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        price: json["price"],
        img: json["img"],
        quantity: json["quantity"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        dateCreated: DateTime.parse(json["date_created"]),
        dateUpdated: json["date_updated"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "price": price,
        "img": img,
        "quantity": quantity,
        "gallery": List<dynamic>.from(gallery!.map((x) => x)),
        "date_created": dateCreated!.toIso8601String(),
        "date_updated": dateUpdated,
        "__v": v,
      };
}
