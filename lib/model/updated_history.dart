import 'dart:convert';

UpdatedHistory updatedHistoryFromJson(String str) =>
    UpdatedHistory.fromJson(json.decode(str));

String updatedHistoryToJson(UpdatedHistory data) => json.encode(data.toJson());

class UpdatedHistory {
  UpdatedHistory({
    required this.status,
    required this.message,
    required this.result,
  });

  final int status;
  final String message;
  final List<Result> result;

  UpdatedHistory copyWith({
    int? status,
    String? message,
    List<Result>? result,
  }) =>
      UpdatedHistory(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory UpdatedHistory.fromJson(Map<String, dynamic> json) => UpdatedHistory(
        status: json["status"],
        message: json["message"],
        result: json["result"] != null
            ? List<Result>.from(json["result"].map((x) => Result.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.tableId,
    required this.isupdate,
    required this.userId,
    required this.productId,
    required this.availableQty,
    required this.tagNumber,
    required this.date,
    required this.location,
    required this.subLocation,
    required this.asset,
    required this.mainCategory,
    required this.category,
    required this.qty,
    required this.uom,
    required this.status,
  });

  final int tableId;
  final int isupdate;
  final String userId;
  final String productId;
  final String availableQty;
  final String tagNumber;
  final String date;
  final String location;
  final String subLocation;
  final String asset;
  final String mainCategory;
  final String category;
  final String qty;
  final String uom;
  final String status;

  Result copyWith({
    int? tableId,
    int? isupdate,
    String? userId,
    String? productId,
    String? availableQty,
    String? tagNumber,
    String? date,
    String? location,
    String? subLocation,
    String? asset,
    String? mainCategory,
    String? category,
    String? qty,
    String? uom,
    String? status,
  }) =>
      Result(
        tableId: tableId ?? this.tableId,
        userId: userId ?? this.userId,
        isupdate: isupdate ?? this.isupdate,
        productId: productId ?? this.productId,
        availableQty: availableQty ?? this.availableQty,
        tagNumber: tagNumber ?? this.tagNumber,
        date: date ?? this.date,
        location: location ?? this.location,
        subLocation: subLocation ?? this.subLocation,
        asset: asset ?? this.asset,
        mainCategory: mainCategory ?? this.mainCategory,
        category: category ?? this.category,
        qty: qty ?? this.qty,
        uom: uom ?? this.uom,
        status: status ?? this.status,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tableId: json["table_id"],
        isupdate: json["is_update"] ?? 0,
        userId: json["user_id"],
        productId: json["product_id"],
        availableQty: json["available_qty"],
        tagNumber: json["tag_number"],
        date: json["date"],
        location: json["location"],
        subLocation: json["sub_location"],
        asset: json["asset"],
        mainCategory: json["main_category"],
        category: json["category"],
        qty: json["qty"],
        uom: json["uom"],
        status: json["status"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "table_id": tableId,
        "user_id": userId,
        "is_update": isupdate,
        "product_id": productId,
        "available_qty": availableQty,
        "tag_number": tagNumber,
        "date": date,
        "location": location,
        "sub_location": subLocation,
        "asset": asset,
        "main_category": mainCategory,
        "category": category,
        "qty": qty,
        "uom": uom,
        "status": status,
      };
}
