import 'dart:convert';

List<ListTradeVisitResponseModel> listTradeVisitResponseModelFromJson(String str) => List<ListTradeVisitResponseModel>.from(json.decode(str).map((x) => ListTradeVisitResponseModel.fromJson(x)));

String listTradeVisitResponseModelToJson(List<ListTradeVisitResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListTradeVisitResponseModel {
  String? visitCode;
  String? outletCode;
  String? category;
  String? brand;
  String? sku;
  String? availability;
  String? listing;
  String? price;
  String? priceChange;
  String? userCode;
  String? duration;
  DateTime? lastvisit;
  String? outletName;

  ListTradeVisitResponseModel({
    this.visitCode,
    this.outletCode,
    this.category,
    this.brand,
    this.sku,
    this.availability,
    this.listing,
    this.price,
    this.priceChange,
    this.userCode,
    this.duration,
    this.lastvisit,
    this.outletName,
  });

  factory ListTradeVisitResponseModel.fromJson(Map<String, dynamic> json) => ListTradeVisitResponseModel(
    visitCode: json["visitCode"],
    outletCode: json["outletCode"],
    category: json["category"],
    brand: json["brand"],
    sku: json["sku"],
    availability: json["availability"],
    listing: json["listing"],
    price: json["price"],
    priceChange: json["priceChange"],
    userCode: json["userCode"],
    duration: json["duration"],
    lastvisit: json["lastvisit"] == null ? null : DateTime.parse(json["lastvisit"]),
    outletName: json["outletName"],
  );

  Map<String, dynamic> toJson() => {
    "visitCode": visitCode,
    "outletCode": outletCode,
    "category": category,
    "brand": brand,
    "sku": sku,
    "availability": availability,
    "listing": listing,
    "price": price,
    "priceChange": priceChange,
    "userCode": userCode,
    "duration": duration,
    "lastvisit": lastvisit?.toIso8601String(),
    "outletName": outletName,
  };
}
