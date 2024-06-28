// To parse this JSON data, do
//
//     final doctorAvailableModel = doctorAvailableModelFromJson(jsonString);

import 'dart:convert';

DoctorAvailableModel doctorAvailableModelFromJson(String str) =>
    DoctorAvailableModel.fromJson(json.decode(str));

String doctorAvailableModelToJson(DoctorAvailableModel data) =>
    json.encode(data.toJson());

class DoctorAvailableModel {
  bool status;
  String message;
  Metadata metadata;
  List<DoctorAvail> data;

  DoctorAvailableModel({
    required this.status,
    required this.message,
    required this.metadata,
    required this.data,
  });

  factory DoctorAvailableModel.fromJson(Map<String, dynamic> json) =>
      DoctorAvailableModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<DoctorAvail>.from(
            json["data"].map((x) => DoctorAvail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DoctorAvail {
  int id;
  String username;
  String email;
  String name;
  String address;
  String phoneNumber;
  String gender;
  bool isAvailable;
  String profilePicture;
  int experience;
  String bachelorAlmamater;
  int bachelorGraduationYear;
  String masterAlmamater;
  int masterGraduationYear;
  String practiceLocation;
  String practiceCity;
  int fee;
  String specialist;
  int balance;
  int ratingPrecentage;

  DoctorAvail({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.gender,
    required this.isAvailable,
    required this.profilePicture,
    required this.experience,
    required this.bachelorAlmamater,
    required this.bachelorGraduationYear,
    required this.masterAlmamater,
    required this.masterGraduationYear,
    required this.practiceLocation,
    required this.practiceCity,
    required this.fee,
    required this.specialist,
    required this.balance,
    required this.ratingPrecentage,
  });

  factory DoctorAvail.fromJson(Map<String, dynamic> json) => DoctorAvail(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        isAvailable: json["is_available"],
        profilePicture: json["profile_picture"],
        experience: json["experience"],
        bachelorAlmamater: json["bachelor_almamater"],
        bachelorGraduationYear: json["bachelor_graduation_year"],
        masterAlmamater: json["master_almamater"],
        masterGraduationYear: json["master_graduation_year"],
        practiceLocation: json["practice_location"],
        practiceCity: json["practice_city"],
        fee: json["fee"],
        specialist: json["specialist"],
        balance: json["balance"],
        ratingPrecentage: json["rating_precentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "gender": gender,
        "is_available": isAvailable,
        "profile_picture": profilePicture,
        "experience": experience,
        "bachelor_almamater": bachelorAlmamater,
        "bachelor_graduation_year": bachelorGraduationYear,
        "master_almamater": masterAlmamater,
        "master_graduation_year": masterGraduationYear,
        "practice_location": practiceLocation,
        "practice_city": practiceCity,
        "fee": fee,
        "specialist": specialist,
        "balance": balance,
        "rating_precentage": ratingPrecentage,
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
