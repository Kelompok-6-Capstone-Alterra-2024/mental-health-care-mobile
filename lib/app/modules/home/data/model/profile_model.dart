// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    bool status;
    String message;
    Data data;

    ProfileModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
    String email;
    String name;
    String username;
    String address;
    String bio;
    String phoneNumber;
    String gender;
    int age;
    String profilePicture;

    Data({
        required this.id,
        required this.email,
        required this.name,
        required this.username,
        required this.address,
        required this.bio,
        required this.phoneNumber,
        required this.gender,
        required this.age,
        required this.profilePicture,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        username: json["username"],
        address: json["address"],
        bio: json["bio"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        age: json["age"],
        profilePicture: json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "username": username,
        "address": address,
        "bio": bio,
        "phone_number": phoneNumber,
        "gender": gender,
        "age": age,
        "profile_picture": profilePicture,
    };
}
