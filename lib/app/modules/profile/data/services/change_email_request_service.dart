// services/email_service.dart
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../models/change_email_request_model.dart';

class EmailService extends GetxService {
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

  Future<Map<String, dynamic>?> changeEmail(String email, String code) async {
    try {
      final response = await _dio.post(
        '$baseUrl/otp/verify/change-email',
        data: ChangeEmailRequest(email: email, code: code).toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${storage.read('token') ?? ''}',
            'apikey': 'your_api_key_here',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        logger.e('Failed to change email: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      logger.e('Error changing email: $e');
      return null;
    }
  }
}
