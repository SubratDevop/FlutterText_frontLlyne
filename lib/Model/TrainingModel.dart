// To parse this JSON data, do
//
//     final trainingModel = trainingModelFromJson(jsonString);

import 'dart:convert';

TrainingModel trainingModelFromJson(String str) => TrainingModel.fromJson(json.decode(str));

String trainingModelToJson(TrainingModel data) => json.encode(data.toJson());

class TrainingModel {
    TrainingModel({
      required  this.isSuccess,
      required  this.data,
      required  this.message,
    });

    bool isSuccess;
    Data data;
    dynamic message;

    factory TrainingModel.fromJson(Map<String, dynamic> json) => TrainingModel(
        isSuccess: json["is_success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "is_success": isSuccess,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
      required  this.trainings,
    });

    List<Training> trainings;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        trainings: List<Training>.from(json["trainings"].map((x) => Training.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "trainings": List<dynamic>.from(trainings.map((x) => x.toJson())),
    };
}

class Training {
    Training({
      required  this.month,
      required  this.trainingEvents,
    });

    String month;
    List<TrainingEvent> trainingEvents;

    factory Training.fromJson(Map<String, dynamic> json) => Training(
        month: json["Month"],
        trainingEvents: List<TrainingEvent>.from(json["training_events"].map((x) => TrainingEvent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Month": month,
        "training_events": List<dynamic>.from(trainingEvents.map((x) => x.toJson())),
    };
}

class TrainingEvent {
    TrainingEvent({
      required  this.date,
      required  this.day,
      required  this.events,
    });

    String date;
    String day;
    List<Event> events;

    factory TrainingEvent.fromJson(Map<String, dynamic> json) => TrainingEvent(
        date: json["Date"],
        day: json["Day"],
        events: List<Event>.from(json["Events"].map((x) => Event.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Date": date,
        "Day": day,
        "Events": List<dynamic>.from(events.map((x) => x.toJson())),
    };
}

class Event {
    Event({
      required  this.id,
      required  this.status,
      required  this.te,
    });

    int id;
    String status;
    Te te;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        status: json["status"] == null ? null : json["status"],
        te: Te.fromJson(json["TE"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status == null ? null : status,
        "TE": te.toJson(),
    };
}

class Te {
    Te({
      required  this.tmName,
    });

    String tmName;

    factory Te.fromJson(Map<String, dynamic> json) => Te(
        tmName: json["tm_name"],
    );

    Map<String, dynamic> toJson() => {
        "tm_name": tmName,
    };
}
