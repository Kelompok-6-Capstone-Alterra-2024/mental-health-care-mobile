import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/data/api/api.dart';

class AuthService extends GetxService {
  static String? token;
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BaseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  final _storage = GetStorage();

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final token = data['data']['token'] as String?;

        if (token != null) {
          _storage.write('token', token);
          Logger().i('Berhasil login');
          return true;
        }
      }
      return false;
    } on Exception catch (e) {
      Logger().e('login gagal: $e');
      return false;
    }
  }

  Future<bool> register({
    required String username,
    required String password,
    required String email,
  }) async {
    print('ini username: $username');
    print('ini password: $password');
    print('ini email: $email');
    try {
      final response = await _dio.post(
        '$BaseUrl/register',
        data: {
          "username": username,
          "password": password,
          "email": email,
        },
      );

      if (response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        final token = data['data']['token'] as String?;
        if (token != null) {
          _storage.write('token', token);
          Logger().i('Berhasil login');
          return true;
        }
        Logger().i('Berhasil membuat akun');
        return true;
      }
      return false;
    } on Exception catch (e) {
      Logger().e('register gagal: $e');
      return false;
    }
  }
}
