import 'dart:convert';

List<Auth> modulesFromJson(String str) =>
    List<Auth>.from(json.decode(str).map((x) => Auth.fromJson(x)));

String modulesToJson(List<Auth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Auth {
  String userEmail;
  String userPassword;

  Auth({
    required this.userEmail,
    required this.userPassword,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        userEmail: json["user_email"],
        userPassword: json["user_pswd"],
      );

  Map<String, dynamic> toJson() => {
        "user_email": userEmail,
        "user_pswd": userPassword,
      };
}
