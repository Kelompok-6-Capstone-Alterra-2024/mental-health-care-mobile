// services/password_service.dart
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../models/change_password_model.dart';

class PasswordService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  PasswordService() {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: false,
    ));
  }

  Future<Map<String, dynamic>> resetPassword(PasswordModel passwordModel) async {
    try {
      final response = await _dio.put(
        '$baseUrl/profiles/password',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
        data: passwordModel.toJson(),
      );

      if (response.statusCode == 200) {
        return {"status": true, "message": "Success Change Password"};
      } else {
        logger.e('Failed to change password: ${response.statusCode}');
        return {"status": false, "message": "Failed to change password"};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        return {"status": false, "message": e.response?.data['message'] ?? "New password and confirmation do not match"};
      } else {
        logger.e('Error changing password: $e');
        return {"status": false, "message": "Error: ${e.message}"};
      }
    }
  }
}
