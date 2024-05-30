import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AuthService extends GetxService {
  static String? token;
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dev-capstone.practiceproject.tech/v1',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/users/login',
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        token = data['data']['token'] as String?;
        return token != null;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
