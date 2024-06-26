import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../data/api/api.dart';
import '../models/storys_model.dart';

class StoryService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = BaseUrl;

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

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<bool> toggleLikeStatus(int storyId, bool isLiked) async {
    try {
      Response response;

      if (isLiked) {
        response = await _dio.delete(
          '$baseUrl/stories/like',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            'story_id': storyId,
          },
        );
      } else {
        response = await _dio.post(
          '$baseUrl/stories/like',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            'story_id': storyId,
          },
        );
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Like status toggled successfully: ${response.data}');
        return true;
      } else {
        logger.e(
            'Failed to toggle like status with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      logger.e('Failed to toggle like status: $e');
      return false;
    }
  }
}
