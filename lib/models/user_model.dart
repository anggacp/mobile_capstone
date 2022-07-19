// To parse this JSON data, do
//
//     final userRsModel = userRsModelFromJson(jsonString);

import 'dart:convert';

UserRsModel userRsModelFromJson(String str) => UserRsModel.fromJson(json.decode(str));

String userRsModelToJson(UserRsModel data) => json.encode(data.toJson());

class UserRsModel {
  UserRsModel({
    this.isSuccessful,
    this.message,
    this.data,
  });

  bool? isSuccessful;
  String? message;
  Data? data;

  factory UserRsModel.fromJson(Map<String, dynamic> json) => UserRsModel(
    isSuccessful: json["isSuccessful"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccessful": isSuccessful,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.accessToken,
    this.idRumahSakit,
  });

  String? accessToken;
  int? idRumahSakit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    idRumahSakit: json["id_rumah_sakit"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "id_rumah_sakit": idRumahSakit,
  };
}
