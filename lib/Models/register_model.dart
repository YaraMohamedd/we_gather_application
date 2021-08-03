// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// class User {
//   User({
//     this.id,
//     this.fname,
//     this.lname,
//     this.email,
//     this.phone,
//     this.emailVerifiedAt,
//     this.img,
//     this.state,
//     this.rememberToken,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String fname;
//   String lname;
//   String email;
//   String phone;
//   dynamic emailVerifiedAt;
//   String img;
//   String state;
//   String rememberToken;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         fname: json["fname"],
//         lname: json["lname"],
//         email: json["email"],
//         phone: json["phone"],
//         emailVerifiedAt: json["email_verified_at"],
//         img: json["img"],
//         state: json["state"],
//         rememberToken: json["remember_token"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "fname": fname,
//         "lname": lname,
//         "email": email,
//         "phone": phone,
//         "email_verified_at": emailVerifiedAt,
//         "img": img,
//         "state": state,
//         "remember_token": rememberToken,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.code,
    this.img,
    this.state,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String fname;
  String lname;
  String email;
  String phone;
  dynamic emailVerifiedAt;
  String code;
  String img;
  String state;
  String rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fname: json["fname"],
    lname: json["lname"],
    email: json["email"],
    phone: json["phone"],
    emailVerifiedAt: json["email_verified_at"],
    code: json["code"],
    img: json["img"],
    state: json["state"],
    rememberToken: json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fname": fname,
    "lname": lname,
    "email": email,
    "phone": phone,
    "email_verified_at": emailVerifiedAt,
    "code": code,
    "img": img,
    "state": state,
    "remember_token": rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
