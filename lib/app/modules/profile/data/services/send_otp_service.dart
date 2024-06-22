import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../models/send_otp_model.dart';

class EmailOTPService extends GetxService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';
  final storage = GetStorage();
  
  @override
  void onInit() {
    super.onInit();
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: false,
    ));
  }

  Future<Map<String, dynamic>?> sendOtp(String email) async {
    try {
      final response = await _dio.post(
        '$baseUrl/otp/send',
        data: EmailRequest(email: email).toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${storage.read('token') ?? ''}',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        logger.e('Failed to send OTP: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      logger.e('Error sending OTP: $e');
      return null;
    }
  }
}
