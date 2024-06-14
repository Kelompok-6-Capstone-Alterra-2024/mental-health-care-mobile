import 'dart:convert';

Storys storysFromJson(String str) => Storys.fromJson(json.decode(str));

String storysToJson(Storys data) => json.encode(data.toJson());

class Storys {
  bool status;
  String message;
  Metadata metadata;
  List<AllStory> data;

  Storys({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory Storys.fromJson(Map<String, dynamic> json) => Storys(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data:
            List<AllStory>.from(json["data"].map((x) => AllStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllStory {
  int id;
  String title;
  String content;
  DateTime date;
  String imageUrl;
  int viewCount;
  bool isLiked;
  Doctor doctor;

  AllStory({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.viewCount,
    required this.isLiked,
    required this.doctor,
  });

  factory AllStory.fromJson(Map<String, dynamic> json) => AllStory(
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

class Metadata {
  int page;
  int limit;

  Metadata({
    required this.page,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        page: json["page"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
      };
}
