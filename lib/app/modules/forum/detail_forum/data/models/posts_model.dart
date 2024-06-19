// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

PostsModel postsModelFromJson(String str) =>
    PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

class PostsModel {
  bool status;
  String message;
  Metadata metadata;
  List<AllPost> data;

  PostsModel({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<AllPost>.from(json["data"].map((x) => AllPost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllPost {
  int id;
  String content;
  String imageUrl;
  int totalComments;
  User user;

  AllPost({
    required this.id,
    required this.content,
    required this.imageUrl,
    required this.totalComments,
    required this.user,
  });

  factory AllPost.fromJson(Map<String, dynamic> json) => AllPost(
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
