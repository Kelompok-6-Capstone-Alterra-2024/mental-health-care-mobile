// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  String id;
  Consultation consultation;
  int price;
  String paymentType;
  String paymentLink;
  String bank;
  String status;
  int pointSpend;
  String createdAt;
  String updatedAt;

  TransactionModel({
    required this.id,
    required this.consultation,
    required this.price,
    required this.paymentType,
    required this.paymentLink,
    required this.bank,
    required this.status,
    required this.pointSpend,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        consultation: Consultation.fromJson(json["consultation"]),
        price: json["price"],
        paymentType: json["payment_type"],
        paymentLink: json["payment_link"],
        bank: json["bank"],
        status: json["status"],
        pointSpend: json["point_spend"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "consultation": consultation.toJson(),
        "price": price,
        "payment_type": paymentType,
        "payment_link": paymentLink,
        "bank": bank,
        "status": status,
        "point_spend": pointSpend,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Consultation {
  int id;
  Doctor doctor;
  String status;
  String paymentStatus;
  bool isAccepted;
  bool isActive;
  String startDate;
  String endDate;

  Consultation({
    required this.id,
    required this.doctor,
    required this.status,
    required this.paymentStatus,
    required this.isAccepted,
    required this.isActive,
    required this.startDate,
    required this.endDate,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        id: json["id"],
        doctor: Doctor.fromJson(json["doctor"]),
        status: json["status"],
        paymentStatus: json["payment_status"],
        isAccepted: json["is_accepted"],
        isActive: json["is_active"],
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor": doctor.toJson(),
        "status": status,
        "payment_status": paymentStatus,
        "is_accepted": isAccepted,
        "is_active": isActive,
        "start_date": startDate,
        "end_date": endDate,
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
