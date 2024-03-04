import 'dart:convert';

List<User> modulesFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String modulesToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String userEmail;
  String userPassword;
  String newPassword;

  User({
    required this.userEmail,
    required this.userPassword,
    required this.newPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userEmail: json["user_email"],
        userPassword: json["user_pswd"],
        newPassword: json["newPassword"], // Add this line
      );

  Map<String, dynamic> toJson() => {
        "user_email": userEmail,
        "user_pswd": userPassword,
        "newPassword": newPassword, // Add this line
      };
}
