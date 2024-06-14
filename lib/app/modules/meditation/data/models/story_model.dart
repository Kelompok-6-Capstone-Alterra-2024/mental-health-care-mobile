import 'dart:convert';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
  bool status;
  String message;
  Data data;

  Story({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
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
  String title;
  String content;
  DateTime date;
  String imageUrl;
  int viewCount;
  bool isLiked;
  Doctor doctor;

  Data({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.viewCount,
    required this.isLiked,
    required this.doctor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        date: DateTime.parse(json["date"]),
        imageUrl: json["image_url"],
        viewCount: json["view_count"],
        isLiked: json["is_liked"],
        doctor: Doctor.fromJson(json["doctor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "date": date.toIso8601String(),
        "image_url": imageUrl,
        "view_count": viewCount,
        "is_liked": isLiked,
        "doctor": doctor.toJson(),
      };
}

class Doctor {
  int id;
  String name;

  Doctor({
    required this.id,
    required this.name,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
