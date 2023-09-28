import 'dart:convert';

List<GetAllChannelResponseModel> getAllChannelResponseModelFromJson(String str) => List<GetAllChannelResponseModel>.from(json.decode(str).map((x) => GetAllChannelResponseModel.fromJson(x)));

String getAllChannelResponseModelToJson(List<GetAllChannelResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllChannelResponseModel {
  String? channel;
  String? subChannel;

  GetAllChannelResponseModel({
    this.channel,
    this.subChannel,
  });

  factory GetAllChannelResponseModel.fromJson(Map<String, dynamic> json) => GetAllChannelResponseModel(
    channel: json["channel"],
    subChannel: json["subChannel"],
  );

  Map<String, dynamic> toJson() => {
    "channel": channel,
    "subChannel": subChannel,
  };
}

