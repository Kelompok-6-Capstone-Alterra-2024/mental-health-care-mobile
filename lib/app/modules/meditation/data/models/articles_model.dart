import 'dart:convert';

Articles articleFromJson(String str) => Articles.fromJson(json.decode(str));

String articleToJson(Articles data) => json.encode(data.toJson());

class Articles {
  bool status;
  String message;
  List<AllArticle> data;

  Articles({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        status: json["status"],
        message: json["message"],
        data: List<AllArticle>.from(
            json["data"].map((x) => AllArticle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllArticle {
  int id;
  int doctorId;
  String title;
  String content;
  String imageUrl;
  DateTime date;
  int viewCount;
  bool isLiked;
  Doctor doctor;

  AllArticle({
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

  factory AllArticle.fromJson(Map<String, dynamic> json) => AllArticle(
        id: json["id"],
        doctorId: json["doctor_id"],
        title: json["title"],
        content: json["content"],
        imageUrl: json["image_url"],
        date: DateTime.parse(json["date"]),
        viewCount: json["view_count"],
        isLiked: json["is_liked"],
        doctor: Doctor.fromJson(json["Doctor"]),
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
        "Doctor": doctor.toJson(),
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
