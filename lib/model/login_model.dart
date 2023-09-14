import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  Login copyWith({
    int? status,
    String? message,
    Result? result,
  }) =>
      Login(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
    this.userId,
    this.name,
    this.email,
  });

  int? userId;
  String? name;
  String? email;

  Result copyWith({
    int? userId,
    String? name,
    String? email,
  }) =>
      Result(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
      };
}
