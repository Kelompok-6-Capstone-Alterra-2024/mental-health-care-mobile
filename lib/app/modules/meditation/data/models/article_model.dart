import 'dart:convert';

Article articleIdFromJson(String str) => Article.fromJson(json.decode(str));

String articleIdToJson(Article data) => json.encode(data.toJson());

class Article {
  bool status;
  String message;
  Data data;

  Article({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
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
  int doctorId;
  String title;
  String content;
  String imageUrl;
  DateTime date;
  int viewCount;
  bool isLiked;
  Doctor doctor;

  Data({
    required this.id,
    required this.doctorId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.date,
    required this.viewCount,
    required this.isLiked,
    required this.doctor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        doctorId: json["doctor_id"],
        title: json["title"],
        content: json["content"],
        imageUrl: json["image_url"],
        date: DateTime.parse(json["date"]),
        viewCount: json["view_count"],
        isLiked: json["is_liked"],
        doctor: Doctor.fromJson(json["doctor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "title": title,
        "content": content,
        "image_url": imageUrl,
        "date": date.toIso8601String(),
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
