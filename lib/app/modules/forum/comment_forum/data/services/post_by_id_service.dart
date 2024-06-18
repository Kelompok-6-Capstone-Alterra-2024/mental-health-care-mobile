import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../models/post_by_id_model.dart';

class PostByIdService {
  final Dio _dio = Dio();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  Future<PostByIdModel> getPostById(int postId) async {
    try {
      final String url = '$baseUrl/posts/$postId';
      final Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return PostByIdModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load post details with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error loading post details: $e');
    }
  }
}
