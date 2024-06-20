// To parse this JSON data, do
//
//     final consultationNoteModel = consultationNoteModelFromJson(jsonString);

import 'dart:convert';

ConsultationNoteModel consultationNoteModelFromJson(String str) => ConsultationNoteModel.fromJson(json.decode(str));

String consultationNoteModelToJson(ConsultationNoteModel data) => json.encode(data.toJson());

class ConsultationNoteModel {
    bool status;
    String message;
    Data data;

    ConsultationNoteModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ConsultationNoteModel.fromJson(Map<String, dynamic> json) => ConsultationNoteModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    int consultationId;
    Doctor doctor;
    Music music;
    Forum forum;
    String mainPoint;
    String nextStep;
    String additionalNote;
    String moodTrackerNote;

    Data({
        required this.id,
        required this.consultationId,
        required this.doctor,
        required this.music,
        required this.forum,
        required this.mainPoint,
        required this.nextStep,
        required this.additionalNote,
        required this.moodTrackerNote,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        consultationId: json["consultation_id"],
        doctor: Doctor.fromJson(json["doctor"]),
        music: Music.fromJson(json["music"]),
        forum: Forum.fromJson(json["forum"]),
        mainPoint: json["main_point"],
        nextStep: json["next_step"],
        additionalNote: json["additional_note"],
        moodTrackerNote: json["mood_tracker_note"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "consultation_id": consultationId,
        "doctor": doctor.toJson(),
        "music": music.toJson(),
        "forum": forum.toJson(),
        "main_point": mainPoint,
        "next_step": nextStep,
        "additional_note": additionalNote,
        "mood_tracker_note": moodTrackerNote,
    };
}

class Doctor {
    int id;
    String name;
    String specialist;
    String imageUrl;

    Doctor({
        required this.id,
        required this.name,
        required this.specialist,
        required this.imageUrl,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        specialist: json["specialist"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specialist": specialist,
        "image_url": imageUrl,
    };
}

class Forum {
    int id;
    String imageUrl;
    String name;

    Forum({
        required this.id,
        required this.imageUrl,
        required this.name,
    });

    factory Forum.fromJson(Map<String, dynamic> json) => Forum(
        id: json["id"],
        imageUrl: json["image_url"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "name": name,
    };
}

class Music {
    int id;
    String imageUrl;
    String title;

    Music({
        required this.id,
        required this.imageUrl,
        required this.title,
    });

    factory Music.fromJson(Map<String, dynamic> json) => Music(
        id: json["id"],
        imageUrl: json["image_url"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "title": title,
    };
}
