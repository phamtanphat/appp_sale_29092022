import 'dart:convert';

class OrderCartResponse {
  OrderCartResponse({
    this.result,
    this.data,
  });

  final int? result;
  final String? data;

  OrderCartResponse copyWith({
    int? result,
    String? data,
  }) =>
      OrderCartResponse(
        result: result ?? this.result,
        data: data ?? this.data,
      );

  factory OrderCartResponse.fromRawJson(String str) =>
      OrderCartResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderCartResponse.fromJson(Map<String, dynamic> json) =>
      OrderCartResponse(
        result: json["result"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": data,
      };
}
