


// To parse this JSON data, do
//
//     final TrainingModel = TrainingModelFromJson(jsonString);

import 'dart:convert';

List<TrainingModel> TrainingModelFromJson(String str) => List<TrainingModel>.from(json.decode(str).map((x) => TrainingModel.fromJson(x)));

String TrainingModelToJson(List<TrainingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrainingModel {
    TrainingModel({
      required  this.userId,
      required  this.id,
      required  this.title,
      required  this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory TrainingModel.fromJson(Map<String, dynamic> json) => TrainingModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
