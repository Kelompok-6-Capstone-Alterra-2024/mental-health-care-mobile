// To parse this JSON data, do
//
//     final allStories = allStoriesFromJson(jsonString);

import 'dart:convert';

AllStories allStoriesFromJson(String str) =>
    AllStories.fromJson(json.decode(str));

String allStoriesToJson(AllStories data) => json.encode(data.toJson());

class AllStories {
  bool status;
  String message;
  Metadata metadata;
  List<DataStory> data;

  AllStories({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory AllStories.fromJson(Map<String, dynamic> json) => AllStories(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<DataStory>.from(
            json["data"].map((x) => DataStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataStory {
  int id;
  String title;
  String content;
  DateTime date;
  String imageUrl;
  bool isLiked;
  Doctor doctor;

  DataStory({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.isLiked,
    required this.doctor,
  });

  factory DataStory.fromJson(Map<String, dynamic> json) => DataStory(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        date: DateTime.parse(json["date"]),
        imageUrl: json["image_url"],
        isLiked: json["is_liked"],
        doctor: Doctor.fromJson(json["doctor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "date": date.toIso8601String(),
        "image_url": imageUrl,
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
