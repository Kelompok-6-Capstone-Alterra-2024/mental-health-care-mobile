import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../models/article_model.dart';
import '../models/articles_model.dart';

class ArticleService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final baseUrl = 'https://dev-capstone.practiceproject.tech/v1/users';

  Future<Articles> getArticles() async {
    try {
      final response = await _dio.get(
        '$baseUrl/articles?page=1&limit=20',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i(response.data);
        return Articles.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load articles with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error loading articles: $e');
      throw Exception('Failed to load articles: $e');
    }
  }

  Future<Article> getArticle(int id) async {
    try {
      final response = await _dio.get(
        '$baseUrl/articles/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        logger.i(response.data);
        return Article.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load article with status code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error loading article: $e');
      throw Exception('Failed to load article: $e');
    }
  }
}
