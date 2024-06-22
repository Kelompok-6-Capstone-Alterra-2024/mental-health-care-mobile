// To parse this JSON data, do
//
//     final allMusicModel = allMusicModelFromJson(jsonString);

import 'dart:convert';

AllMusicModel allMusicModelFromJson(String str) =>
    AllMusicModel.fromJson(json.decode(str));

String allMusicModelToJson(AllMusicModel data) => json.encode(data.toJson());

class AllMusicModel {
  bool status;
  String message;
  Metadata metadata;
  List<DataMusic> data;

  AllMusicModel({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory AllMusicModel.fromJson(Map<String, dynamic> json) => AllMusicModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<DataMusic>.from(
            json["data"].map((x) => DataMusic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataMusic {
  int id;
  String title;
  String singer;
  String musicUrl;
  String imageUrl;
  bool isLiked;

  DataMusic({
    required this.id,
    required this.title,
    required this.singer,
    required this.musicUrl,
    required this.imageUrl,
    required this.isLiked,
  });

  factory DataMusic.fromJson(Map<String, dynamic> json) => DataMusic(
        id: json["id"],
        title: json["title"],
        singer: json["singer"],
        musicUrl: json["music_url"],
        imageUrl: json["image_url"],
        isLiked: json["is_liked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "singer": singer,
        "music_url": musicUrl,
        "image_url": imageUrl,
        "is_liked": isLiked,
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
