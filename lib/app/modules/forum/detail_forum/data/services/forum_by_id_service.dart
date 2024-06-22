import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../data/api/api.dart';
import '../models/forum_by_id_model.dart';

class ForumByIdService {
  final Dio _dio = Dio();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = BaseUrl;

  Future<ForumByIdModel> getForumById(int forumId) async {
    try {
      final url = '$baseUrl/forums/$forumId';
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
        return ForumByIdModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load forum details with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error loading forum details: $e');
    }
  }
}
