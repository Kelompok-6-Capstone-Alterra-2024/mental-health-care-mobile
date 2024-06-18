// To parse this JSON data, do
//
//     final forumByIdModel = forumByIdModelFromJson(jsonString);

import 'dart:convert';

ForumByIdModel forumByIdModelFromJson(String str) =>
    ForumByIdModel.fromJson(json.decode(str));

String forumByIdModelToJson(ForumByIdModel data) => json.encode(data.toJson());

class ForumByIdModel {
  bool status;
  String message;
  Data data;

  ForumByIdModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ForumByIdModel.fromJson(Map<String, dynamic> json) => ForumByIdModel(
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
  int forumId;
  String name;
  String description;
  String imageUrl;

  Data({
    required this.forumId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        forumId: json["forum_id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "forum_id": forumId,
        "name": name,
        "description": description,
        "image_url": imageUrl,
      };
}
