// To parse this JSON data, do
//
//     final moodDetailsModel = moodDetailsModelFromJson(jsonString);

import 'dart:convert';

MoodDetailsModel moodDetailsModelFromJson(String str) => MoodDetailsModel.fromJson(json.decode(str));

String moodDetailsModelToJson(MoodDetailsModel data) => json.encode(data.toJson());

class MoodDetailsModel {
    bool status;
    String message;
    DataMood data;

    MoodDetailsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory MoodDetailsModel.fromJson(Map<String, dynamic> json) => MoodDetailsModel(
        status: json["status"],
        message: json["message"],
        data: DataMood.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class DataMood {
    int id;
    String message;
    String date;
    String imageUrl;
    MoodType moodType;

    DataMood({
        required this.id,
        required this.message,
        required this.date,
        required this.imageUrl,
        required this.moodType,
    });

    factory DataMood.fromJson(Map<String, dynamic> json) => DataMood(
        id: json["id"],
        message: json["message"],
        date: json["date"],
        imageUrl: json["image_url"],
        moodType: MoodType.fromJson(json["mood_type"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "date": date,
        "image_url": imageUrl,
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
