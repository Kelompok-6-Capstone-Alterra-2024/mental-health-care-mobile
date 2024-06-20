import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
    bool status;
    String message;
    List<Data> data;

    MessageModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        status: json["status"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    int id;
    String message;
    String role;
    DateTime date;

    Data({
        required this.id,
        required this.message,
        required this.role,
        required this.date,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
