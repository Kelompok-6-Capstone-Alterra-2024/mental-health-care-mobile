// To parse this JSON data, do
//
//     final recommendationForumModel = recommendationForumModelFromJson(jsonString);

import 'dart:convert';

RecommendationForumModel recommendationForumModelFromJson(String str) =>
    RecommendationForumModel.fromJson(json.decode(str));

String recommendationForumModelToJson(RecommendationForumModel data) =>
    json.encode(data.toJson());

class RecommendationForumModel {
  bool status;
  String message;
  Metadata metadata;
  List<RecommendationForum> data;

  RecommendationForumModel({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory RecommendationForumModel.fromJson(Map<String, dynamic> json) =>
      RecommendationForumModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<RecommendationForum>.from(
            json["data"].map((x) => RecommendationForum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RecommendationForum {
  int forumId;
  String name;
  String imageUrl;
  int numberOfMembers;

  RecommendationForum({
    required this.forumId,
    required this.name,
    required this.imageUrl,
    required this.numberOfMembers,
  });

  factory RecommendationForum.fromJson(Map<String, dynamic> json) =>
      RecommendationForum(
        forumId: json["forum_id"],
        name: json["name"],
        imageUrl: json["image_url"],
        numberOfMembers: json["number_of_members"],
      );

  Map<String, dynamic> toJson() => {
        "forum_id": forumId,
        "name": name,
        "image_url": imageUrl,
        "number_of_members": numberOfMembers,
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
