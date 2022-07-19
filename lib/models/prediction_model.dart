// To parse this JSON data, do
//
//     final predictionModel = predictionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PredictionModel predictionModelFromJson(String str) => PredictionModel.fromJson(json.decode(str));

String predictionModelToJson(PredictionModel data) => json.encode(data.toJson());

class PredictionModel {
  PredictionModel({
    required this.predictions,
    required this.success
  });

  List<Prediction> predictions;
  bool success;

  factory PredictionModel.fromJson(Map<String, dynamic> json) => PredictionModel(
    predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
    "success": success,
  };
}

class Prediction {
  Prediction({
    required this.kasus,
    required this.tanggal,
  });

  int kasus;
  DateTime tanggal;

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    kasus: json["kasus"],
    tanggal: DateTime.parse(json["tanggal"]),
  );

  Map<String, dynamic> toJson() => {
    "kasus": kasus,
    "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
  };
}
