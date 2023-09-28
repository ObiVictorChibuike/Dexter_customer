

import 'dart:convert';

List<OutletRequestModelResponse> outletRequestModelResponseFromJson(String str) => List<OutletRequestModelResponse>.from(json.decode(str).map((x) => OutletRequestModelResponse.fromJson(x)));

String outletRequestModelResponseToJson(List<OutletRequestModelResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OutletRequestModelResponse {
  String? name;
  String? outletCode;
  String? address;
  String? state;
  String? region;
  String? city;
  String? channel;
  String? subChannel;
  String? managerName;
  String? managerPhoneNumber;
  String? supplierName;
  String? userCode;
  DateTime? lastvisit;

  OutletRequestModelResponse({
    this.name,
    this.outletCode,
    this.address,
    this.state,
    this.region,
    this.city,
    this.channel,
    this.subChannel,
    this.managerName,
    this.managerPhoneNumber,
    this.supplierName,
    this.userCode,
    this.lastvisit,
  });

  factory OutletRequestModelResponse.fromJson(Map<String, dynamic> json) => OutletRequestModelResponse(
    name: json["name"],
    outletCode: json["outletCode"],
    address: json["address"],
    state: json["state"],
    region: json["region"],
    city: json["city"],
    channel: json["channel"],
    subChannel: json["subChannel"],
    managerName: json["managerName"],
    managerPhoneNumber: json["managerPhoneNumber"],
    supplierName: json["supplierName"],
    userCode: json["userCode"],
    lastvisit: json["lastvisit"] == null ? null : DateTime.parse(json["lastvisit"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "outletCode": outletCode,
    "address": address,
    "state": state,
    "region": region,
    "city": city,
    "channel": channel,
    "subChannel": subChannel,
    "managerName": managerName,
    "managerPhoneNumber": managerPhoneNumber,
    "supplierName": supplierName,
    "userCode": userCode,
    "lastvisit": lastvisit?.toIso8601String(),
  };
}
