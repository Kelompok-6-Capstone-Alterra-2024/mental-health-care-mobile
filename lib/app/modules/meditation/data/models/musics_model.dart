import 'dart:convert';

Musics musicsFromJson(String str) => Musics.fromJson(json.decode(str));

String musicsToJson(Musics data) => json.encode(data.toJson());

class Musics {
  bool status;
  String message;
  Metadata metadata;
  List<AllMusic> data;

  Musics({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory Musics.fromJson(Map<String, dynamic> json) => Musics(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data:
            List<AllMusic>.from(json["data"].map((x) => AllMusic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllMusic {
  int id;
  String title;
  String singer;
  String musicUrl;
  String imageUrl;
  bool isLiked;

  AllMusic({
    required this.id,
    required this.title,
    required this.singer,
    required this.musicUrl,
    required this.imageUrl,
    required this.isLiked,
  });

  factory AllMusic.fromJson(Map<String, dynamic> json) => AllMusic(
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
