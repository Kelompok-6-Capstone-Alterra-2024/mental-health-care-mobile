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

  Future<void> likePost(int postId) async {
    try {
      final String url = '$baseUrl/posts/like';
      final Response response = await _dio.post(
        url,
        data: {
          'post_id': postId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Post liked successfully');
      } else {
        throw Exception(
            'Failed to like post with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error liking post: $e');
    }
  }

  Future<void> unlikePost(int postId) async {
    try {
      final String url = '$baseUrl/posts/like';
      final Response response = await _dio.post(
        url,
        data: {
          'post_id': postId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Post unliked successfully');
      } else {
        throw Exception(
            'Failed to unlike post with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error unliking post: $e');
    }
  }
}
