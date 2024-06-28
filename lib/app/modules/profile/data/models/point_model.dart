import 'dart:convert';

Point pointFromJson(String str) => Point.fromJson(json.decode(str));

String pointToJson(Point data) => json.encode(data.toJson());

class Point {
  bool status;
  String message;
  Data data;

  Point({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Point.fromJson(Map<String, dynamic> json) => Point(
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
  int points;

  Data({
    required this.points,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
      };
}
