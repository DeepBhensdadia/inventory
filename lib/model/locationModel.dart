import 'dart:convert';

LocationData locationdataFromJson(String str) =>
    LocationData.fromJson(json.decode(str));

String locationDataToJson(LocationData data) => json.encode(data.toJson());

class LocationData {
  LocationData({
    required this.status,
    required this.message,
    required this.result,
  });

  final int status;
  final String message;
  final List<Result> result;

  LocationData copyWith({
    int? status,
    String? message,
    List<Result>? result,
  }) =>
      LocationData(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        status: json["status"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.locationId,
    required this.locationCode,
    required this.locationName,
  });

  final int locationId;
  final String locationCode;
  final String locationName;

  Result copyWith({
    int? locationId,
    String? locationCode,
    String? locationName,
  }) =>
      Result(
        locationId: locationId ?? this.locationId,
        locationCode: locationCode ?? this.locationCode,
        locationName: locationName ?? this.locationName,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        locationId: json["location_id"],
        locationCode: json["location_code"],
        locationName: json["location_name"],
      );

  Map<String, dynamic> toJson() => {
        "location_id": locationId,
        "location_code": locationCode,
        "location_name": locationName,
      };
}
