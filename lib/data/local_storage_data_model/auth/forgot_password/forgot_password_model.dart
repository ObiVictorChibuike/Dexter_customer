
class ForgotPasswordDataModel {
  String? emailAddress;

  ForgotPasswordDataModel({
    this.emailAddress,
  });

  factory ForgotPasswordDataModel.fromJson(Map<String, dynamic> json) => ForgotPasswordDataModel(
    emailAddress: json["emailAddress"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
  };
}
