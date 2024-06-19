import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import '../models/posts_model.dart';

class PostService {
  final Dio _dio = Dio();
  final Logger _logger = Logger();
  final String _baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';
  final String? _token = GetStorage().read('token');

  Future<void> createPost({
    required int forumId,
    required String content,
    File? imageFile,
  }) async {
    try {
      String fileName = '';
      MediaType? contentType;

      if (imageFile != null) {
        fileName = imageFile.path.split('/').last;
        String fileExtension = fileName.split('.').last.toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
          contentType = MediaType('image', 'jpeg');
        } else if (fileExtension == 'png') {
          contentType = MediaType('image', 'png');
        } else {
          throw Exception('File type not supported');
        }
      }

      FormData formData = FormData.fromMap({
        'forum_id': forumId,
        'content': content,
        'image': imageFile != null
            ? await MultipartFile.fromFile(
                imageFile.path,
                filename: fileName,
                contentType: contentType,
              )
            : null,
      });

      final response = await _dio.post(
        '$_baseUrl/posts',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      _logger.i(response.data);
    } catch (e) {
      _logger.e('Error creating post', error: e);
      rethrow;
    }
  }

  Future<PostsModel> getAllPostsByForumId(int forumId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/forums/$forumId/posts',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      return PostsModel.fromJson(response.data);
    } catch (e) {
      _logger.e('Error getting posts by forum id', error: e);
      rethrow;
    }
  }

  Future<void> likePost(int postId) async {
    try {
      final String url = '$_baseUrl/posts/like';
      final Response response = await _dio.post(
        url,
        data: {
          'post_id': postId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $_token',
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
}
