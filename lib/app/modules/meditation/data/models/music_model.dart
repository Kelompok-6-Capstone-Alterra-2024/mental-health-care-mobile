import 'dart:convert';

Music musicFromJson(String str) => Music.fromJson(json.decode(str));

String musicToJson(Music data) => json.encode(data.toJson());

class Music {
    bool status;
    String message;
    Data data;

    Music({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Music.fromJson(Map<String, dynamic> json) => Music(
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
    String title;
    String singer;
    String musicUrl;
    String imageUrl;
    int viewCount;
    bool isLiked;

    Data({
        required this.id,
        required this.title,
        required this.singer,
        required this.musicUrl,
        required this.imageUrl,
        required this.viewCount,
        required this.isLiked,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        singer: json["singer"],
        musicUrl: json["music_url"],
        imageUrl: json["image_url"],
        viewCount: json["view_count"],
        isLiked: json["is_liked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "singer": singer,
        "music_url": musicUrl,
        "image_url": imageUrl,
        "view_count": viewCount,
        "is_liked": isLiked,
    };
}
