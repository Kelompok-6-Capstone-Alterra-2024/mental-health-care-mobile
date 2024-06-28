import 'dart:io';
import 'package:get/route_manager.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/routes/app_pages.dart';

import '../../../../data/api/api.dart';
import '../models/profile_model.dart';

class ProfileService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = BaseUrl;

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
        logger.i(response.data);
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

  Future<Response> postProfile({
    required String username,
    required String address,
    required String phoneNumber,
    required String gender,
    required File? file,
  }) async {
    try {
      String fileName = '';
      MediaType? contentType;

      if (file != null) {
        fileName = file.path.split('/').last;
        String fileExtension = fileName.split('.').last.toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
          contentType = MediaType('image', 'jpeg');
        } else if (fileExtension == 'png') {
          contentType = MediaType('image', 'png');
        } else {
          throw Exception('File type not supported');
        }
      }
      final FormData formData = FormData.fromMap({
        'username': username,
        'address': address,
        'phone_number': phoneNumber,
        'gender': gender,
        'image': file != null
            ? await MultipartFile.fromFile(
                file.path,
                filename: fileName,
                contentType: contentType,
              )
            : null,
      });

      final response = await _dio.put(
        '$baseUrl/profiles',
        data: formData,
        options: Options(
          contentType: Headers.multipartFormDataContentType,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i('Profile updated');
        Get.offAllNamed(Routes.NAVIGATION);
        logger.i(response.data);
        return response;
      } else {
        logger.e('Failed to update profile: ${response.statusCode}');
        throw Exception("Gagal Update Profile");
      }
    } catch (e) {
      logger.e('Error updating profile: $e');
      throw Exception("Gagal Update Profile");
    }
  }
}
