// To parse this JSON data, do
//
//     final moodModel = moodModelFromJson(jsonString);

import 'dart:convert';

MoodModel moodModelFromJson(String str) => MoodModel.fromJson(json.decode(str));

String moodModelToJson(MoodModel data) => json.encode(data.toJson());

class MoodModel {
    bool status;
    String message;
    List<Mood> data;

    MoodModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory MoodModel.fromJson(Map<String, dynamic> json) => MoodModel(
        status: json["status"],
        message: json["message"],
        data: List<Mood>.from(json["data"].map((x) => Mood.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Mood {
    int id;
    DateTime date;
    MoodType moodType;

    Mood({
        required this.id,
        required this.date,
        required this.moodType,
    });

    factory Mood.fromJson(Map<String, dynamic> json) => Mood(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        moodType: MoodType.fromJson(json["mood_type"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "mood_type": moodType.toJson(),
    };
}

class MoodType {
    int id;
    String name;

    MoodType({
        required this.id,
        required this.name,
    });

    factory MoodType.fromJson(Map<String, dynamic> json) => MoodType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
