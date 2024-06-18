// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
    String id;
    Consultation consultation;
    int price;
    String paymentType;
    String paymentLink;
    String bank;
    String status;
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
        required this.createdAt,
        required this.updatedAt,
    });

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json["id"],
        consultation: Consultation.fromJson(json["consultation"]),
        price: json["price"],
        paymentType: json["payment_type"],
        paymentLink: json["payment_link"],
        bank: json["bank"],
        status: json["status"],
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
    DateTime date;
    String time;

    Consultation({
        required this.id,
        required this.doctor,
        required this.status,
        required this.paymentStatus,
        required this.isAccepted,
        required this.isActive,
        required this.date,
        required this.time,
    });

    factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        id: json["id"],
        doctor: Doctor.fromJson(json["Doctor"]),
        status: json["Status"],
        paymentStatus: json["PaymentStatus"],
        isAccepted: json["IsAccepted"],
        isActive: json["IsActive"],
        date: DateTime.parse(json["Date"]),
        time: json["Time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Doctor": doctor.toJson(),
        "Status": status,
        "PaymentStatus": paymentStatus,
        "IsAccepted": isAccepted,
        "IsActive": isActive,
        "Date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "Time": time,
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
