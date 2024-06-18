import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../models/storys_model.dart';

class StoryService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  Future<Storys> getStorys() async {
    try {
      final response = await _dio.get(
        '$baseUrl/stories?page=1&limit=10',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i(response.data);
        return Storys.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load Storys with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error loading Storys: $e');
      throw Exception('Failed to load Storys: $e');
    }
  }
}
