// To parse this JSON data, do
//
//     final postByIdModel = postByIdModelFromJson(jsonString);

import 'dart:convert';

PostByIdModel postByIdModelFromJson(String str) =>
    PostByIdModel.fromJson(json.decode(str));

String postByIdModelToJson(PostByIdModel data) => json.encode(data.toJson());

class PostByIdModel {
  bool status;
  String message;
  Data data;

  PostByIdModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PostByIdModel.fromJson(Map<String, dynamic> json) => PostByIdModel(
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
  String content;
  String imageUrl;
  int totalComments;
  User user;

  Data({
    required this.id,
    required this.content,
    required this.imageUrl,
    required this.totalComments,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        content: json["content"],
        imageUrl: json["image_url"],
        totalComments: json["total_comments"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "image_url": imageUrl,
        "total_comments": totalComments,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String username;
  String profilePicture;

  User({
    required this.id,
    required this.username,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "profile_picture": profilePicture,
      };
}
