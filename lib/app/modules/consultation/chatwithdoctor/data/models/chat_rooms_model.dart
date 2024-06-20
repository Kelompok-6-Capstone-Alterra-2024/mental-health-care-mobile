// To parse this JSON data, do
//
//     final chatRoomsModel = chatRoomsModelFromJson(jsonString);

import 'dart:convert';

ChatRoomsModel chatRoomsModelFromJson(String str) =>
    ChatRoomsModel.fromJson(json.decode(str));

String chatRoomsModelToJson(ChatRoomsModel data) => json.encode(data.toJson());

class ChatRoomsModel {
  bool status;
  String message;
  List<Info> data;

  ChatRoomsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChatRoomsModel.fromJson(Map<String, dynamic> json) => ChatRoomsModel(
        status: json["status"],
        message: json["message"],
        data: List<Info>.from(json["data"].map((x) => Info.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Info {
  int id;
  String status;
  bool isRejected;
  String endTime;
  LatestMessage latestMessage;
  Doctor doctor;

  Info({
    required this.id,
    required this.status,
    required this.isRejected,
    required this.endTime,
    required this.latestMessage,
    required this.doctor,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        status: json["status"],
        isRejected: json["isrejected"],
        endTime: json["end_time"],
        latestMessage: LatestMessage.fromJson(json["latest_message"]),
        doctor: Doctor.fromJson(json["doctor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "isrejected": isRejected,
        "end_time": endTime,
        "latest_message": latestMessage.toJson(),
        "doctor": doctor.toJson(),
      };
}

class Doctor {
  int id;
  String name;
  String username;
  String imageUrl;
  String specialist;

  Doctor({
    required this.id,
    required this.name,
    required this.username,
    required this.imageUrl,
    required this.specialist,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        imageUrl: json["image_url"],
        specialist: json["specialist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "image_url": imageUrl,
        "specialist": specialist,
      };
}

class LatestMessage {
  int id;
  String message;
  String date;

  LatestMessage({
    required this.id,
    required this.message,
    required this.date,
  });

  factory LatestMessage.fromJson(Map<String, dynamic> json) => LatestMessage(
        id: json["id"],
        message: json["message"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "date": date,
      };
}
