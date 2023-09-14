// To parse this JSON data, do
//
//     final assetDetails = assetDetailsFromJson(jsonString);

import 'dart:convert';

AssetDetails assetDetailsFromJson(String str) =>
    AssetDetails.fromJson(json.decode(str));

String assetDetailsToJson(AssetDetails data) => json.encode(data.toJson());

class AssetDetails {
  AssetDetails({
    required this.status,
    required this.message,
    required this.result,
  });

  final int? status;
  final String? message;
  final Result? result;

  AssetDetails copyWith({
    int? status,
    String? message,
    Result? result,
  }) =>
      AssetDetails(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory AssetDetails.fromJson(Map<String, dynamic> json) => AssetDetails(
        status: json["status"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result?.toJson(),
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
    required this.uom,
    required this.qty,
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
  final String uom;
  final String qty;
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
    String? uom,
    String? qty,
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
        uom: uom ?? this.uom,
        qty: qty ?? this.qty,
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
        uom: json["uom"],
        qty: json["qty"],
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
        "uom": uom,
        "qty": qty,
        "available_qty": availableQty,
        "status": status,
      };
}
