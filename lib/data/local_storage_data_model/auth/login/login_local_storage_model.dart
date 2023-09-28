
class LoginLocalStorageModel {
  String? emailAddress;
  String? password;
  bool? rememberMe;

  LoginLocalStorageModel({
    this.emailAddress,
    this.password,
    this.rememberMe,
  });

  factory LoginLocalStorageModel.fromJson(Map<String, dynamic> json) => LoginLocalStorageModel(
    emailAddress: json["emailAddress"],
    password: json["password"],
    rememberMe: json["rememberMe"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "password": password,
    "rememberMe": rememberMe,
  };
}
