import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/data/api/api.dart';

class JoinForumService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = BaseUrl;

  Future<void> joinForum(int forumId) async {
    try {
      final url = '$baseUrl/forums/join';
      logger.i('Request URL: $url');

      final response = await _dio.post(
        url,
        data: {
          'forum_id': forumId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Joined forum successfully');
      } else {
        throw Exception(
            'Failed to join forum with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error joining forum: $e');
      throw Exception('Failed to join forum: $e');
    }
  }
}
