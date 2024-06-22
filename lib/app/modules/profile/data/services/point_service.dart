import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../models/point_model.dart';

class PointService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  PointService() {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: false,
    ));
  }

  Future<Point?> getPoints() async {
    try {
      final response = await _dio.get(
        '$baseUrl/points',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return Point.fromJson(response.data);
      } else {
        logger.e('Failed to load points: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      logger.e('Error getting points: $e');
      return null;
    }
  }
}
