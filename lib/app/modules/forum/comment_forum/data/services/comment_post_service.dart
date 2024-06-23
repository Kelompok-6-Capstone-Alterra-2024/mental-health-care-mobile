import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mindease/app/data/api/api.dart';
import '../models/comment_post_model.dart';

class CommentPostService {
  final Dio _dio = Dio();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = BaseUrl;

  Future<CommentPostModel> getComments(int postId,
      {int page = 1, int limit = 20}) async {
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

  Future<void> postComment(int postId, String content) async {
    try {
      final String url = '$baseUrl/comments';
      final Response response = await _dio.post(
        url,
        data: {
          'post_id': postId,
          'content': content,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Comment posted successfully');
      } else {
        throw Exception(
            'Failed to post comment with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error posting comment: $e');
    }
  }
}
