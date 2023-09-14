// To parse this JSON data, do
//
//     final assetCredintial = assetCredintialFromJson(jsonString);

import 'dart:convert';

AssetCredintial assetCredintialFromJson(String str) =>
    AssetCredintial.fromJson(json.decode(str));

String assetCredintialToJson(AssetCredintial data) =>
    json.encode(data.toJson());

class AssetCredintial {
  AssetCredintial({
    required this.companyId,
    required this.tagNumber,
    required this.mainCategory,
  });

  final String companyId;
  final String tagNumber;
  final String mainCategory;

  AssetCredintial copyWith({
    String? companyId,
    String? tagNumber,
    String? mainCategory,
  }) =>
      AssetCredintial(
        companyId: companyId ?? this.companyId,
        tagNumber: tagNumber ?? this.tagNumber,
        mainCategory: mainCategory ?? this.mainCategory,
      );

  factory AssetCredintial.fromJson(Map<String, dynamic> json) =>
      AssetCredintial(
        companyId: json["company_id"],
        tagNumber: json["tag_number"],
        mainCategory: json["main_category"],
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "tag_number": tagNumber,
        "main_category": mainCategory,
      };
}
