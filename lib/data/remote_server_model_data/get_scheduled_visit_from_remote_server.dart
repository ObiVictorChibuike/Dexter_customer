
import 'dart:convert';

List<ScheduleVisitsFromRemoteServerResponse> scheduleVisitsFromRemoteServerResponseFromJson(String str) => List<ScheduleVisitsFromRemoteServerResponse>.from(json.decode(str).map((x) => ScheduleVisitsFromRemoteServerResponse.fromJson(x)));

String scheduleVisitsFromRemoteServerResponseToJson(List<ScheduleVisitsFromRemoteServerResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduleVisitsFromRemoteServerResponse {
  String? outletname;
  String? outletcode;
  String? outletaddress;
  DateTime? date;
  String? day;

  ScheduleVisitsFromRemoteServerResponse({
    this.outletname,
    this.outletcode,
    this.outletaddress,
    this.date,
    this.day,
  });

  factory ScheduleVisitsFromRemoteServerResponse.fromJson(Map<String, dynamic> json) => ScheduleVisitsFromRemoteServerResponse(
    outletname: json["outletname"],
    outletcode: json["outletcode"],
    outletaddress: json["outletaddress"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "outletname": outletname,
    "outletcode": outletcode,
    "outletaddress": outletaddress,
    "date": date?.toIso8601String(),
    "day": day,
  };
}
