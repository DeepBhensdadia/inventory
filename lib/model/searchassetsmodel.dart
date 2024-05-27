// To parse this JSON data, do
//
//     final searchassetsmodel = searchassetsmodelFromJson(jsonString);

import 'dart:convert';

Searchassetsmodel searchassetsmodelFromJson(String str) =>
    Searchassetsmodel.fromJson(json.decode(str));

String searchassetsmodelToJson(Searchassetsmodel data) =>
    json.encode(data.toJson());

class Searchassetsmodel {
  List<assetsdetails>? data;

  Searchassetsmodel({
    this.data,
  });

  factory Searchassetsmodel.fromJson(Map<String, dynamic> json) =>
      Searchassetsmodel(
        data: json["data"] != [] ? List<assetsdetails>.from(
            json["data"].map((x) => assetsdetails.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class assetsdetails {
  int? id;
  String? userId;
  int? companyId;
  String? sheetNo;
  dynamic productDate;
  String? location;
  String? subLocation;
  String? itemCode;
  String? asset;
  dynamic mainCategory;
  String? category;
  String? qty;
  String? uom;
  dynamic availableQty;
  dynamic remark;
  int? status;
  int? isUpdate;
  DateTime? createdAt;
  DateTime? updatedAt;

  assetsdetails({
    this.id,
    this.userId,
    this.companyId,
    this.sheetNo,
    this.productDate,
    this.location,
    this.subLocation,
    this.itemCode,
    this.asset,
    this.mainCategory,
    this.category,
    this.qty,
    this.uom,
    this.availableQty,
    this.remark,
    this.status,
    this.isUpdate,
    this.createdAt,
    this.updatedAt,
  });

  factory assetsdetails.fromJson(Map<String, dynamic> json) => assetsdetails(
        id: json["id"],
        userId: json["user_id"],
        companyId: json["company_id"],
        sheetNo: json["sheet_no"],
        productDate: json["product_date"],
        location: json["location"],
        subLocation: json["sub_location"],
        itemCode: json["item_code"],
        asset: json["asset"],
        mainCategory: json["main_category"],
        category: json["category"],
        qty: json["qty"],
        uom: json["uom"],
        availableQty: json["available_qty"],
        remark: json["remark"],
        status: json["status"],
        isUpdate: json["is_update"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company_id": companyId,
        "sheet_no": sheetNo,
        "product_date": productDate,
        "location": location,
        "sub_location": subLocation,
        "item_code": itemCode,
        "asset": asset,
        "main_category": mainCategory,
        "category": category,
        "qty": qty,
        "uom": uom,
        "available_qty": availableQty,
        "remark": remark,
        "status": status,
        "is_update": isUpdate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
