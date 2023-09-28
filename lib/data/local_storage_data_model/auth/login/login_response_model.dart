
class LoginResponseModel {
  int? status;
  String? message;
  dynamic userCode;

  LoginResponseModel({
    this.status,
    this.message,
    this.userCode,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    status: json["status"],
    message: json["message"],
    userCode: json["userCode"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "userCode": userCode,
  };
}
