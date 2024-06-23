import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../data/api/api.dart';
import '../models/musics_model.dart';

class MusicService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = BaseUrl;

  Future<Musics> getMusics() async {
    try {
      final response = await _dio.get(
        '$baseUrl/musics?page=1&limit=20',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i(response.data);
        return Musics.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load musics with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error loading musics: $e');
      throw Exception('Failed to load musics: $e');
    }
  }

  Future<bool> toggleLikeStatus(int musicId, bool isLiked) async {
    try {
      Response response;

      if (isLiked) {
        response = await _dio.delete(
          '$baseUrl/musics/like',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            'music_id': musicId,
          },
        );
      } else {
        response = await _dio.post(
          '$baseUrl/musics/like',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            'music_id': musicId,
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
      logger.e('Error toggling like status: $e');
      return false;
    }
  }
}
