// To parse this JSON data, do
//
//     final doctorAvailableModel = doctorAvailableModelFromJson(jsonString);

import 'dart:convert';

DoctorAvailableModel doctorAvailableModelFromJson(String str) => DoctorAvailableModel.fromJson(json.decode(str));

String doctorAvailableModelToJson(DoctorAvailableModel data) => json.encode(data.toJson());

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

    factory DoctorAvailableModel.fromJson(Map<String, dynamic> json) => DoctorAvailableModel(
        status: json["status"],
        message: json["message"],
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<DoctorAvail>.from(json["data"].map((x) => DoctorAvail.fromJson(x))),
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
    Gender gender;
    bool isAvailable;
    String profilePicture;
    int balance;
    int experience;
    String almamater;
    int graduationYear;
    String practiceLocation;
    String practiceCity;
    PracticeProvince practiceProvince;
    String strNumber;
    int fee;
    String specialist;
    int amount;

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

    factory DoctorAvail.fromJson(Map<String, dynamic> json) => DoctorAvail(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        gender: genderValues.map[json["gender"]]!,
        isAvailable: json["is_available"],
        profilePicture: json["profile_picture"],
        balance: json["balance"],
        experience: json["experience"],
        almamater: json["almamater"],
        graduationYear: json["graduation_year"],
        practiceLocation: json["practice_location"],
        practiceCity: json["practice_city"],
        practiceProvince: practiceProvinceValues.map[json["practice_province"]]!,
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
        "gender": genderValues.reverse[gender],
        "is_available": isAvailable,
        "profile_picture": profilePicture,
        "balance": balance,
        "experience": experience,
        "almamater": almamater,
        "graduation_year": graduationYear,
        "practice_location": practiceLocation,
        "practice_city": practiceCity,
        "practice_province": practiceProvinceValues.reverse[practiceProvince],
        "str_number": strNumber,
        "fee": fee,
        "specialist": specialist,
        "amount": amount,
    };
}

enum Gender {
    PRIA,
    WANITA
}

final genderValues = EnumValues({
    "pria": Gender.PRIA,
    "wanita": Gender.WANITA
});

enum PracticeProvince {
    JAKARTA,
    JAWA_TENGAH,
    JAWA_TENGAH_21
}

final practiceProvinceValues = EnumValues({
    "Jakarta": PracticeProvince.JAKARTA,
    "Jawa Tengah": PracticeProvince.JAWA_TENGAH,
    "Jawa Tengah!2{1": PracticeProvince.JAWA_TENGAH_21
});

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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
