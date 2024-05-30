import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

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
        Logger().i('Berhasil login');
        return token != null;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> register({
    required String username,
    required String password,
    required String email,
  }) async {
    try {
      final response = await _dio.post(
        '/users/register',
        data: {
          "username": username,
          "password": password,
          "email": email,
        },
      );

      if (response.statusCode == 201) {
        Logger().i('Berhasil membuat akun');
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
