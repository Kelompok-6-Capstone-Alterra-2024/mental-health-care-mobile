// To parse this JSON data, do
//
//     final commentPostModel = commentPostModelFromJson(jsonString);

import 'dart:convert';

CommentPostModel commentPostModelFromJson(String str) =>
    CommentPostModel.fromJson(json.decode(str));

String commentPostModelToJson(CommentPostModel data) =>
    json.encode(data.toJson());

class CommentPostModel {
  bool status;
  String message;
  Metadata metadata;
  List<AllComment> data;

  CommentPostModel({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory CommentPostModel.fromJson(Map<String, dynamic> json) =>
      CommentPostModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<AllComment>.from(
            json["data"].map((x) => AllComment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllComment {
  int id;
  String content;
  int postId;
  DateTime createdAt;
  User user;

  AllComment({
    required this.id,
    required this.content,
    required this.postId,
    required this.createdAt,
    required this.user,
  });

  factory AllComment.fromJson(Map<String, dynamic> json) => AllComment(
        id: json["id"],
        content: json["content"],
        postId: json["post_id"],
        createdAt: DateTime.parse(json["created_at"]),
        user: User.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "post_id": postId,
        "created_at": createdAt.toIso8601String(),
        "User": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String username;
  String profilePicture;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "profile_picture": profilePicture,
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
