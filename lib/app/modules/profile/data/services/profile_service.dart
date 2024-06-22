import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../models/profile_model.dart';

class ProfileService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  ProfileService() {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: false,
    ));
  }

  Future<Profile?> getProfile() async {
    try {
      final response = await _dio.get(
        '$baseUrl/profiles',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return Profile.fromJson(response.data);
      } else {
        logger.e('Failed to load profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      logger.e('Error getting profile: $e');
      return null;
    }
  }

  Future<Response> postProfile(
      String username, String phoneNumber, String gender, String address
      // String? profilePicture,
      ) async {
    try {
      final response = await _dio.post(
        '$baseUrl/profiles',
        data: FormData.fromMap({
          '_method': 'PUT',
          'username': 'rizki',
          'address': 'denpasar',
          'phone_number': '085123456789',
          'gender': 'pria',
          'profile_picture':
              "https://res.cloudinary.com/dy2fwknbn/image/upload/v1719029655/qucnujinjg0xuu9owbwg.jpg"
        }),
        options: Options(
          contentType: Headers.multipartFormDataContentType,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i(response.data);
        return response;
      } else {
        logger.e('Failed to update profile: ${response.statusCode}');
        throw Exception("Gagal Update");
      }
    } catch (e) {
      logger.e('Error updating profile: $e');
      throw Exception("Gagal Update Profile");
    }
  }
}
