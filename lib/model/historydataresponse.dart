import 'dart:convert';

Historydataresponse historydataresponseFromJson(String str) =>
    Historydataresponse.fromJson(json.decode(str));

String historydataresponseToJson(Historydataresponse data) =>
    json.encode(data.toJson());

class Historydataresponse {
  Historydataresponse({
    required this.status,
    required this.message,
    required this.result,
  });

  final int status;
  final String message;
  final dynamic result;

  Historydataresponse copyWith({
    int? status,
    String? message,
    Result? result,
  }) =>
      Historydataresponse(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory Historydataresponse.fromJson(Map<String, dynamic> json) =>
      Historydataresponse(
        status: json["status"],
        message: json["message"],
        result:json["result"] != null ? Result.fromJson(json["result"]): {},
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.tableId,
    required this.tagNumber,
    required this.location,
    required this.subLocation,
    required this.date,
    required this.asset,
    required this.mainCategory,
    required this.category,
    required this.qty,
    required this.uom,
    required this.availableQty,
    required this.status,
  });

  final int tableId;
  final String tagNumber;
  final String location;
  final String subLocation;
  final String date;
  final String asset;
  final String mainCategory;
  final String category;
  final String qty;
  final String uom;
  final String availableQty;
  final String status;

  Result copyWith({
    int? tableId,
    String? tagNumber,
    String? location,
    String? subLocation,
    String? date,
    String? asset,
    String? mainCategory,
    String? category,
    String? qty,
    String? uom,
    String? availableQty,
    String? status,
  }) =>
      Result(
        tableId: tableId ?? this.tableId,
        tagNumber: tagNumber ?? this.tagNumber,
        location: location ?? this.location,
        subLocation: subLocation ?? this.subLocation,
        date: date ?? this.date,
        asset: asset ?? this.asset,
        mainCategory: mainCategory ?? this.mainCategory,
        category: category ?? this.category,
        qty: qty ?? this.qty,
        uom: uom ?? this.uom,
        availableQty: availableQty ?? this.availableQty,
        status: status ?? this.status,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tableId: json["table_id"],
        tagNumber: json["tag_number"],
        location: json["location"],
        subLocation: json["sub_location"],
        date: json["date"],
        asset: json["asset"],
        mainCategory: json["main_category"],
        category: json["category"],
        qty: json["qty"],
        uom: json["uom"],
        availableQty: json["available_qty"],
        status: json["status"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "table_id": tableId,
        "tag_number": tagNumber,
        "location": location,
        "sub_location": subLocation,
        "date": date,
        "asset": asset,
        "main_category": mainCategory,
        "category": category,
        "qty": qty,
        "uom": uom,
        "available_qty": availableQty,
        "status": status,
      };
}
