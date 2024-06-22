import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../../data/api/api.dart';

class LeaveForumService {
  final Dio _dio = Dio();
  final String _token = GetStorage().read('token') ?? '';
  final String _baseUrl = BaseUrl;

  final logger = Logger();

  Future<void> leaveForum(int forumId) async {
    try {
      final url = '$_baseUrl/forums/$forumId';

      final response = await _dio.delete(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i('Successfully left forum');
      } else {
        throw Exception(
            'Failed to leave forum with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error leaving forum', error: e);
      throw Exception('Failed to leave forum: $e');
    }
  }
}
