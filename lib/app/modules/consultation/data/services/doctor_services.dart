import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/modules/consultation/data/models/consultation_by_id.dart';

import '../../../../data/api/api.dart';
import '../models/doctor_model.dart';
import '../models/transaction_model.dart';

class DoctorServices extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<DoctorModel> getAllDoctor() async {
    try {
      final response = await dio.get(
        '$baseUrl/doctors?page=1&limit=10',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return DoctorModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ConsultationByIdModel> postSchedule(
      int doctorId, String date, String time) async {
    print('doctorId: $doctorId');
    print('date: $date');
    print('time: $time');
    try {
      final response = await dio.post(
        '$baseUrl/consultations',
        data: {
          'doctor_id': doctorId,
          'date': date,
          'time': time,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 201) {
        logger.i(response.data);
        return ConsultationByIdModel.fromJson(response.data);
      } else {
        throw Exception('Failed to create schedule');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> postComplaint(int consultationId, String name, int age,
      String gender, String message, String medicalHistory) {
    return dio.post(
      '$baseUrl/complaint',
      data: {
        'consultation_id': consultationId,
        'name': name,
        'age': age,
        'gender': gender,
        'message': message,
        'medical_history': medicalHistory,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<TransactionModel> postPayment(int consultationId, int price) async {
    print(consultationId);
    print(price);
    try {
      final response = await dio.post(
        '$baseUrl/payments/gateway',
        data: {
          'consultation_id': consultationId,
          'price': price,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 201) {
        logger.i(response.data);
        print(response.data['payment_link']);
        return TransactionModel.fromJson(response.data);
      } else {
        Get.snackbar('Error', response.data['message']);
        throw Exception('Failed to create payment');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        logger.e('Error: ${e.response?.statusCode} ${e.response?.data}');
        Get.snackbar('Error', e.response?.data['message'],
            backgroundColor: Colors.red.withOpacity(0.3));
        if (e.response?.statusCode == 500) {
          throw Exception('Internal Server Error (500)');
        } else {
          throw Exception(
              'Failed to create schedule: ${e.response?.statusCode}');
        }
      } else {
        logger.e('Error sending request: $e');
        throw Exception('Error sending request: $e');
      }
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
