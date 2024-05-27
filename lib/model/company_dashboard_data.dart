// To parse this JSON data, do
//
//     final dashboarddata = dashboarddataFromJson(jsonString);

import 'dart:convert';

Dashboarddata dashboarddataFromJson(String str) =>
    Dashboarddata.fromJson(json.decode(str));

String dashboarddataToJson(Dashboarddata data) => json.encode(data.toJson());

class Dashboarddata {
  Dashboarddata({
    required this.status,
    required this.message,
    required this.result,
  });

  final int status;
  final String message;
  final Result result;

  Dashboarddata copyWith({
    int? status,
    String? message,
    Result? result,
  }) =>
      Dashboarddata(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory Dashboarddata.fromJson(Map<String, dynamic> json) => Dashboarddata(
        status: json["status"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.getProductCategoryA,
    required this.getProductCategoryB,
    required this.getProductCategoryC,
    required this.getProductQtyTotal,
    required this.getProductCategoryCountA,
    required this.getProductCategoryCountB,
    required this.getProductCategoryCountC,
    required this.getProductCategoryCountTotal,
    required this.getProductQtyAvailableQtyA,
    required this.getProductQtyAvailableQtyB,
    required this.getProductQtyAvailableQtyC,
    required this.getProductQtyAvailableQtyTotal,
    required this.getGroupByUserId,
    required this.getProductQtyA,
    required this.getProductQtyB,
    required this.getProductQtyC,
    required this.getProductQtyAvailableQtyTotalSum,
    required this.getProductQtyTotalCount,
    required this.getProductQtyACount,
    required this.getProductQtyBCount,
    required this.getProductQtyCCount,
    required this.metaTitle,
  });

  final String getProductCategoryA;
  final String getProductCategoryB;
  final String getProductCategoryC;
  final String getProductQtyTotal;
  final String getProductCategoryCountA;
  final String getProductCategoryCountB;
  final String getProductCategoryCountC;
  final String getProductCategoryCountTotal;
  final String getProductQtyAvailableQtyA;
  final String getProductQtyAvailableQtyB;
  final String getProductQtyAvailableQtyC;
  final String getProductQtyAvailableQtyTotal;
  final List<GetGroupByUserId> getGroupByUserId;
  final String getProductQtyA;
  final String getProductQtyB;
  final String getProductQtyC;
  final String getProductQtyAvailableQtyTotalSum;
  final String getProductQtyTotalCount;
  final String getProductQtyACount;
  final String getProductQtyBCount;
  final String getProductQtyCCount;
  final String metaTitle;

  Result copyWith({
    String? getProductCategoryA,
    String? getProductCategoryB,
    String? getProductCategoryC,
    String? getProductQtyTotal,
    String? getProductCategoryCountA,
    String? getProductCategoryCountB,
    String? getProductCategoryCountC,
    String? getProductCategoryCountTotal,
    String? getProductQtyAvailableQtyA,
    String? getProductQtyAvailableQtyB,
    String? getProductQtyAvailableQtyC,
    String? getProductQtyAvailableQtyTotal,
    List<GetGroupByUserId>? getGroupByUserId,
    String? getProductQtyA,
    String? getProductQtyB,
    String? getProductQtyC,
    String? getProductQtyAvailableQtyTotalSum,
    String? getProductQtyTotalCount,
    String? getProductQtyACount,
    String? getProductQtyBCount,
    String? getProductQtyCCount,
    String? metaTitle,
  }) =>
      Result(
        getProductCategoryA: getProductCategoryA ?? this.getProductCategoryA,
        getProductCategoryB: getProductCategoryB ?? this.getProductCategoryB,
        getProductCategoryC: getProductCategoryC ?? this.getProductCategoryC,
        getProductQtyTotal: getProductQtyTotal ?? this.getProductQtyTotal,
        getProductCategoryCountA:
            getProductCategoryCountA ?? this.getProductCategoryCountA,
        getProductCategoryCountB:
            getProductCategoryCountB ?? this.getProductCategoryCountB,
        getProductCategoryCountC:
            getProductCategoryCountC ?? this.getProductCategoryCountC,
        getProductCategoryCountTotal:
            getProductCategoryCountTotal ?? this.getProductCategoryCountTotal,
        getProductQtyAvailableQtyA:
            getProductQtyAvailableQtyA ?? this.getProductQtyAvailableQtyA,
        getProductQtyAvailableQtyB:
            getProductQtyAvailableQtyB ?? this.getProductQtyAvailableQtyB,
        getProductQtyAvailableQtyC:
            getProductQtyAvailableQtyC ?? this.getProductQtyAvailableQtyC,
        getProductQtyAvailableQtyTotal: getProductQtyAvailableQtyTotal ??
            this.getProductQtyAvailableQtyTotal,
        getGroupByUserId: getGroupByUserId ?? this.getGroupByUserId,
        getProductQtyA: getProductQtyA ?? this.getProductQtyA,
        getProductQtyB: getProductQtyB ?? this.getProductQtyB,
        getProductQtyC: getProductQtyC ?? this.getProductQtyC,
        getProductQtyAvailableQtyTotalSum: getProductQtyAvailableQtyTotalSum ??
            this.getProductQtyAvailableQtyTotalSum,
        getProductQtyTotalCount:
            getProductQtyTotalCount ?? this.getProductQtyTotalCount,
        getProductQtyACount: getProductQtyACount ?? this.getProductQtyACount,
        getProductQtyBCount: getProductQtyBCount ?? this.getProductQtyBCount,
        getProductQtyCCount: getProductQtyCCount ?? this.getProductQtyCCount,
        metaTitle: metaTitle ?? this.metaTitle,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        getProductCategoryA: json["getProductCategoryA"].toString(),
        getProductCategoryB: json["getProductCategoryB"].toString(),
        getProductCategoryC: json["getProductCategoryC"].toString(),
        getProductQtyTotal: json["getProductQTYTotal"].toString(),
        getProductCategoryCountA: json["getProductCategoryCountA"].toString(),
        getProductCategoryCountB: json["getProductCategoryCountB"].toString(),
        getProductCategoryCountC: json["getProductCategoryCountC"].toString(),
        getProductCategoryCountTotal:
            json["getProductCategoryCountTotal"].toString(),
        getProductQtyAvailableQtyA:
            json["getProductQTYAvailableQtyA"].toString(),
        getProductQtyAvailableQtyB:
            json["getProductQTYAvailableQtyB"].toString(),
        getProductQtyAvailableQtyC:
            json["getProductQTYAvailableQtyC"].toString(),
        getProductQtyAvailableQtyTotal:
            json["getProductQTYAvailableQtyTotal"].toString(),
        getGroupByUserId: List<GetGroupByUserId>.from(
            json["getGroupByUserID"].map((x) => GetGroupByUserId.fromJson(x))),
        getProductQtyA: json["getProductQtyA"].toString(),
        getProductQtyB: json["getProductQtyB"].toString(),
        getProductQtyC: json["getProductQtyC"].toString(),
        getProductQtyAvailableQtyTotalSum:
            json["getProductQTYAvailableQtyTotalSUM"].toString(),
        getProductQtyTotalCount: json["getProductQtyTotalCount"].toString(),
        getProductQtyACount: json["getProductQtyACount"].toString(),
        getProductQtyBCount: json["getProductQtyBCount"].toString(),
        getProductQtyCCount: json["getProductQtyCCount"].toString(),
        metaTitle: json["meta_title"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "getProductCategoryA": getProductCategoryA,
        "getProductCategoryB": getProductCategoryB,
        "getProductCategoryC": getProductCategoryC,
        "getProductQTYTotal": getProductQtyTotal,
        "getProductCategoryCountA": getProductCategoryCountA,
        "getProductCategoryCountB": getProductCategoryCountB,
        "getProductCategoryCountC": getProductCategoryCountC,
        "getProductCategoryCountTotal": getProductCategoryCountTotal,
        "getProductQTYAvailableQtyA": getProductQtyAvailableQtyA,
        "getProductQTYAvailableQtyB": getProductQtyAvailableQtyB,
        "getProductQTYAvailableQtyC": getProductQtyAvailableQtyC,
        "getProductQTYAvailableQtyTotal": getProductQtyAvailableQtyTotal,
        "getGroupByUserID":
            List<dynamic>.from(getGroupByUserId.map((x) => x.toJson())),
        "getProductQtyA": getProductQtyA,
        "getProductQtyB": getProductQtyB,
        "getProductQtyC": getProductQtyC,
        "getProductQTYAvailableQtyTotalSUM": getProductQtyAvailableQtyTotalSum,
        "getProductQtyTotalCount": getProductQtyTotalCount,
        "getProductQtyACount": getProductQtyACount,
        "getProductQtyBCount": getProductQtyBCount,
        "getProductQtyCCount": getProductQtyCCount,
        "meta_title": metaTitle,
      };
}

class GetGroupByUserId {
  GetGroupByUserId({
    required this.userId,
    required this.name,
    required this.totalQty,
    required this.userIdTotal,
  });

  final String userId;
  final String name;
  final dynamic totalQty;
  final dynamic userIdTotal;

  GetGroupByUserId copyWith({
    String? userId,
    String? name,
    dynamic totalQty,
    dynamic userIdTotal,
  }) =>
      GetGroupByUserId(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        totalQty: totalQty ?? this.totalQty,
        userIdTotal: userIdTotal ?? this.userIdTotal,
      );

  factory GetGroupByUserId.fromJson(Map<String, dynamic> json) =>
      GetGroupByUserId(
        userId: json["user_id"],
        name: json["name"],
        totalQty: json["total_qty"],
        userIdTotal: json["user_id_total"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "total_qty": totalQty,
        "user_id_total": userIdTotal,
      };
}
