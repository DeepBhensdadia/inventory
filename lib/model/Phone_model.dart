import 'dart:convert';

Phonedata phonedataFromJson(String str) => Phonedata.fromJson(json.decode(str));

String phonedataToJson(Phonedata data) => json.encode(data.toJson());

class Phonedata {
  Phonedata({
    required this.status,
    required this.message,
    required this.result,
  });

  final int? status;
  final String? message;
  final Result? result;

  Phonedata copyWith({
    int? status,
    String? message,
    Result? result,
  }) =>
      Phonedata(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory Phonedata.fromJson(Map<String, dynamic> json) => Phonedata(
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
    required this.companyId,
    required this.companyCode,
    required this.companyName,
    required this.mobileno,
    required this.companyAddress,
  });

  final int companyId;
  final String companyCode;
  final String companyName;
  final String mobileno;
  final String companyAddress;

  Result copyWith({
    int? companyId,
    String? companyCode,
    String? companyName,
    String? mobileno,
    String? companyAddress,
  }) =>
      Result(
        companyId: companyId ?? this.companyId,
        companyCode: companyCode ?? this.companyCode,
        companyName: companyName ?? this.companyName,
        mobileno: mobileno ?? this.mobileno,
        companyAddress: companyAddress ?? this.companyAddress,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        companyId: json["company_id"],
        companyCode: json["company_code"],
        companyName: json["company_name"],
        mobileno: json["mobileno"],
        companyAddress: json["company_address"],
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "company_code": companyCode,
        "company_name": companyName,
        "mobileno": mobileno,
        "company_address": companyAddress,
      };
}
