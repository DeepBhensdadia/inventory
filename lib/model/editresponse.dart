// To parse this JSON data, do
//
//     final editresponse = editresponseFromJson(jsonString);

import 'dart:convert';

Editresponse editresponseFromJson(String str) => Editresponse.fromJson(json.decode(str));

String editresponseToJson(Editresponse data) => json.encode(data.toJson());

class Editresponse {
  String? message;
  bool? success;

  Editresponse({
    this.message,
    this.success,
  });

  factory Editresponse.fromJson(Map<String, dynamic> json) => Editresponse(
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
  };
}
