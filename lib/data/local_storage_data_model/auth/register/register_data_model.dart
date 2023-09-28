
class RegisterDataModel {
  String? emailAddress;
  String? password;
  String? phoneNumber;

  RegisterDataModel({
    this.emailAddress,
    this.password,
    this.phoneNumber
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) => RegisterDataModel(
    emailAddress: json["emailAddress"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "password": password,
    "phoneNumber": phoneNumber,
  };
}
