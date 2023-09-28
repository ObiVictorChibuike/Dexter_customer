
class ScheduleVisitResponseModel {
  String? outletCode;
  DateTime? date;
  String? day;
  String? userCode;

  ScheduleVisitResponseModel({
    this.outletCode,
    this.date,
    this.day,
    this.userCode,
  });

  factory ScheduleVisitResponseModel.fromJson(Map<String, dynamic> json) => ScheduleVisitResponseModel(
    outletCode: json["outletCode"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    day: json["day"],
    userCode: json["userCode"],
  );

  Map<String, dynamic> toJson() => {
    "outletCode": outletCode,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "day": day,
    "userCode": userCode,
  };
}
