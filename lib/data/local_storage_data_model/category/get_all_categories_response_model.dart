

import 'dart:convert';

List<GetAllCategoriesResponseModel> getAllCategoriesResponseModelFromJson(String str) => List<GetAllCategoriesResponseModel>.from(json.decode(str).map((x) => GetAllCategoriesResponseModel.fromJson(x)));

String getAllCategoriesResponseModelToJson(List<GetAllCategoriesResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllCategoriesResponseModel {
  String? category;
  String? brand;
  String? skuList;

  GetAllCategoriesResponseModel({
    this.category,
    this.brand,
    this.skuList,
  });

  factory GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) => GetAllCategoriesResponseModel(
    category: json["category"],
    brand: json["brand"],
    skuList: json["sku_list"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "brand": brand,
    "sku_list": skuList,
  };
}

enum Category {
  FOOD,
  SPIRITS,
  WINES
}

final categoryValues = EnumValues({
  "FOOD": Category.FOOD,
  "SPIRITS": Category.SPIRITS,
  "WINES": Category.WINES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
