// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
    bool status;
    String message;
    Metadata metadata;
    List<Doctor> data;

    DoctorModel({
        required this.status,
        required this.message,
        required this.metadata,
        required this.data,
    });

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<Doctor>.from(json["data"].map((x) => Doctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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
