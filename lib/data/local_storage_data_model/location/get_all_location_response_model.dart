import 'dart:convert';

List<GetAllLocationResponseModel> getAllLocationResponseModelFromJson(String str) => List<GetAllLocationResponseModel>.from(json.decode(str).map((x) => GetAllLocationResponseModel.fromJson(x)));

String getAllLocationResponseModelToJson(List<GetAllLocationResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllLocationResponseModel {
  String? state;
  String? region;
  String? city;

  GetAllLocationResponseModel({
    this.state,
    this.region,
    this.city,
  });

  factory GetAllLocationResponseModel.fromJson(Map<String, dynamic> json) => GetAllLocationResponseModel(
    state: json["state"],
    region: json["region"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "region": regionValues.reverse[region],
    "city": city,
  };
}

enum Region {
  NORTH_CENTRAL,
  NORTH_EAST,
  NORTH_WEST,
  SOUTH_EAST,
  SOUTH_SOUTH,
  SOUTH_WEST
}

final regionValues = EnumValues({
  "North-Central": Region.NORTH_CENTRAL,
  "North-East": Region.NORTH_EAST,
  "North-West": Region.NORTH_WEST,
  "South-East": Region.SOUTH_EAST,
  "South-South": Region.SOUTH_SOUTH,
  "South-West": Region.SOUTH_WEST
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
