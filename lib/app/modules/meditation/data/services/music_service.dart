import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../models/music_model.dart';
import '../models/musics_model.dart';

class MusicService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  Future<Musics> getMusics() async {
    try {
      final response = await _dio.get(
        '$baseUrl/musics?page=1&limit=2',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i('musics response: ${response.data}');
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

  Future<Music> getMusic(int id) async {
    try {
      final response = await _dio.get(
        '$baseUrl/Musics/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i('Music response: ${response.data}');
        return Music.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load Music with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error loading Music: $e');
      throw Exception('Failed to load Music: $e');
    }
  }
}
