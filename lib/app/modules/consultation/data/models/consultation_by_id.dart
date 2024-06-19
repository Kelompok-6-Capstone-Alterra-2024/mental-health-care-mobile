// To parse this JSON data, do
//
//     final consultationByIdModel = consultationByIdModelFromJson(jsonString);

import 'dart:convert';

ConsultationByIdModel consultationByIdModelFromJson(String str) =>
    ConsultationByIdModel.fromJson(json.decode(str));

String consultationByIdModelToJson(ConsultationByIdModel data) =>
    json.encode(data.toJson());

class ConsultationByIdModel {
  bool status;
  String message;
  Data data;

  ConsultationByIdModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ConsultationByIdModel.fromJson(Map<String, dynamic> json) =>
      ConsultationByIdModel(
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
  Doctor doctor;
  String status;
  String paymentStatus;
  bool isAccepted;
  bool isActive;
  DateTime startDate;
  DateTime endDate;

  Data({
    required this.id,
    required this.doctor,
    required this.status,
    required this.paymentStatus,
    required this.isAccepted,
    required this.isActive,
    required this.startDate,
    required this.endDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        doctor: Doctor.fromJson(json["doctor"]),
        status: json["status"],
        paymentStatus: json["payment_status"],
        isAccepted: json["is_accepted"],
        isActive: json["is_active"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor": doctor.toJson(),
        "status": status,
        "payment_status": paymentStatus,
        "is_accepted": isAccepted,
        "is_active": isActive,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
      };
}

class Doctor {
  int id;
  String username;
  String email;
  String name;
  String address;
  String phoneNumber;
  String gender;
  bool isAvailable;
  String profilePicture;
  int balance;
  int experience;
  String almamater;
  int graduationYear;
  String practiceLocation;
  String practiceCity;
  String practiceProvince;
  String strNumber;
  int fee;
  String specialist;
  int amount;

  Doctor({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.gender,
    required this.isAvailable,
    required this.profilePicture,
    required this.balance,
    required this.experience,
    required this.almamater,
    required this.graduationYear,
    required this.practiceLocation,
    required this.practiceCity,
    required this.practiceProvince,
    required this.strNumber,
    required this.fee,
    required this.specialist,
    required this.amount,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        isAvailable: json["is_available"],
        profilePicture: json["profile_picture"],
        balance: json["balance"],
        experience: json["experience"],
        almamater: json["almamater"],
        graduationYear: json["graduation_year"],
        practiceLocation: json["practice_location"],
        practiceCity: json["practice_city"],
        practiceProvince: json["practice_province"],
        strNumber: json["str_number"],
        fee: json["fee"],
        specialist: json["specialist"],
        amount: json["amount"],
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
        "balance": balance,
        "experience": experience,
        "almamater": almamater,
        "graduation_year": graduationYear,
        "practice_location": practiceLocation,
        "practice_city": practiceCity,
        "practice_province": practiceProvince,
        "str_number": strNumber,
        "fee": fee,
        "specialist": specialist,
        "amount": amount,
      };
}
