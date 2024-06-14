import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../models/joined_forum_model.dart';

class JoinedForumService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  Future<JoinedForumModel> getJoinedForums() async {
    try {
      final url = '$baseUrl/forums?page=1&limit=5';
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
        logger.i('Response data: ${response.data}');
        return JoinedForumModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load joined forums with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error loading joined forums: $e');
      throw Exception('Failed to load joined forums: $e');
    }
  }
}
