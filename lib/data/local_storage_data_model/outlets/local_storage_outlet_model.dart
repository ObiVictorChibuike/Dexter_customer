// To parse this JSON data, do
//
//     final outletRequestModelResponse = outletRequestModelResponseFromJson(jsonString);

import 'dart:convert';

List<OutletRequestModelResponse> outletRequestModelResponseFromJson(String str) => List<OutletRequestModelResponse>.from(json.decode(str).map((x) => OutletRequestModelResponse.fromJson(x)));

String outletRequestModelResponseToJson(List<OutletRequestModelResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OutletRequestModelResponse {
  String? name;
  String? outletcode;
  String? address;
  String? state;
  String? region;
  String? city;
  String? channel;
  String? subChannel;
  String? managerName;
  String? managerPhoneNumber;
  String? supplierName;
  String? usercode;
  DateTime? lastvisit;

  OutletRequestModelResponse({
    this.name,
    this.outletcode,
    this.address,
    this.state,
    this.region,
    this.city,
    this.channel,
    this.subChannel,
    this.managerName,
    this.managerPhoneNumber,
    this.supplierName,
    this.usercode,
    this.lastvisit,
  });

  factory OutletRequestModelResponse.fromJson(Map<String, dynamic> json) => OutletRequestModelResponse(
    name: json["name"],
    outletcode: json["outletcode"],
    address: json["address"],
    state: json["state"],
    region: json["region"],
    city: json["city"],
    channel: json["channel"],
    subChannel: json["subChannel"],
    managerName: json["managerName"],
    managerPhoneNumber: json["managerPhoneNumber"],
    supplierName: json["supplierName"],
    usercode: json["usercode"],
    lastvisit: json["lastvisit"] == null ? null : DateTime.parse(json["lastvisit"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "outletcode": outletcode,
    "address": address,
    "state": state,
    "region": region,
    "city": city,
    "channel": channel,
    "subChannel": subChannel,
    "managerName": managerName,
    "managerPhoneNumber": managerPhoneNumber,
    "supplierName": supplierName,
    "usercode": usercode,
    "lastvisit": lastvisit?.toIso8601String(),
  };
}
