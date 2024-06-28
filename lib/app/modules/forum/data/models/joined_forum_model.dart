// To parse this JSON data, do
//
//     final joinedForumModel = joinedForumModelFromJson(jsonString);

import 'dart:convert';

JoinedForumModel joinedForumModelFromJson(String str) =>
    JoinedForumModel.fromJson(json.decode(str));

String joinedForumModelToJson(JoinedForumModel data) =>
    json.encode(data.toJson());

class JoinedForumModel {
  bool status;
  String message;
  Metadata metadata;
  List<JoinedForum> data;

  JoinedForumModel({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory JoinedForumModel.fromJson(Map<String, dynamic> json) =>
      JoinedForumModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<JoinedForum>.from(
            json["data"].map((x) => JoinedForum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class JoinedForum {
  int forumId;
  String name;
  String imageUrl;
  int numberOfMembers;
  List<User> user;

  JoinedForum({
    required this.forumId,
    required this.name,
    required this.imageUrl,
    required this.numberOfMembers,
    required this.user,
  });

  factory JoinedForum.fromJson(Map<String, dynamic> json) => JoinedForum(
        forumId: json["forum_id"],
        name: json["name"],
        imageUrl: json["image_url"],
        numberOfMembers: json["number_of_members"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forum_id": forumId,
        "name": name,
        "image_url": imageUrl,
        "number_of_members": numberOfMembers,
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
      };
}

class User {
  int userId;
  String profilePicture;

  User({
    required this.userId,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
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
