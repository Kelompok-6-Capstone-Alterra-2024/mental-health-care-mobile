import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../data/api/api.dart';
import '../models/recommendation_forum_model.dart';

class RecommendationForumService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = BaseUrl;

  Future<RecommendationForumModel> getRecommendationForums() async {
    try {
      final url = '$baseUrl/forums/recommendation?page=1&limit=10';
      logger.i('Request URL: $url');

      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i(response.data);
        return RecommendationForumModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load recommendation forums with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error loading recommendation forums: $e');
      throw Exception('Failed to load recommendation forums: $e');
    }
  }
}
