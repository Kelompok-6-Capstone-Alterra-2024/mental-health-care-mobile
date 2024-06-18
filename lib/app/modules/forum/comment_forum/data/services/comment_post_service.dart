import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../models/comment_post_model.dart';

class CommentPostService {
  final Dio _dio = Dio();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  Future<CommentPostModel> getComments(int postId,
      {int page = 1, int limit = 3}) async {
    try {
      final String url =
          '$baseUrl/posts/$postId/comments?page=$page&limit=$limit';
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
        return CommentPostModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load comments with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error loading comments: $e');
    }
  }
}
