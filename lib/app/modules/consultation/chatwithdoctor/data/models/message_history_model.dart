import 'dart:convert';

MessageHistory messageHistoryFromJson(String str) => MessageHistory.fromJson(json.decode(str));

String messageHistoryToJson(MessageHistory data) => json.encode(data.toJson());

class MessageHistory {
  bool status;
  String message;
  List<MessageData> data;

  MessageHistory({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MessageHistory.fromJson(Map<String, dynamic> json) => MessageHistory(
    status: json["status"],
    message: json["message"],
    data: List<MessageData>.from(json["data"].map((x) => MessageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MessageData {
  int id;
  String message;
  String role;
  DateTime date;

  MessageData({
    required this.id,
    required this.message,
    required this.role,
    required this.date,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
    id: json["id"],
    message: json["message"],
    role: json["role"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "role": role,
    "date": date.toIso8601String(),
  };
}
