import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/data/api/api.dart';
import 'package:mindease/app/modules/home/mood_track/data/model/mood_model.dart';

class MoodService {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<void> addMood(
      int moodId, String note, String date, File? image) async {
    try {
      final response = await dio.post(
        '$baseUrl/moods',
        data: {
          'mood_type_id': moodId,
          'message': note,
          'image': image,
          'date': date
        },
        options: Options(
          contentType: Headers.multipartFormDataContentType,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      logger.i(response.data);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<MoodModel> getMoodByDate(String startDate, endDate) async {
    try {
      final response = await dio.get(
        '$baseUrl/moods?start_date=$startDate&end_date=$endDate',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return MoodModel.fromJson(response.data);
      } else {
        logger.e(response.data);
        throw Exception('Gagal mendapatkan data mood');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
