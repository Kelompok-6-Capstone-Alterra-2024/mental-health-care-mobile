import 'dart:io';
import 'package:http_parser/src/media_type.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/data/api/api.dart';
import 'package:mindease/app/modules/home/mood_track/data/model/mood_details_model.dart';
import 'package:mindease/app/modules/home/mood_track/data/model/mood_model.dart';

class MoodService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<void> addMood(
      {required int moodId,
      required String note,
      required String date,
      File? file}) async {
    try {
      String fileName = '';
      MediaType? contentType;

      if (file != null) {
        fileName = file.path.split('/').last;
        String fileExtension = fileName.split('.').last.toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
          contentType = MediaType('image', 'jpeg');
        } else if (fileExtension == 'png') {
          contentType = MediaType('image', 'png');
        } else {
          throw Exception('File type not supported');
        }
      }

      final FormData formData = FormData.fromMap({
        'mood_type_id': moodId,
        'message': note,
        'image': file != null
            ? await MultipartFile.fromFile(
                file.path,
                filename: fileName,
                contentType: contentType,
              )
            : null,
        'date': date
      });

      final response = await dio.post(
        '$baseUrl/moods',
        data: formData,
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

  Future<MoodDetailsModel> getMoodDetail(int moodId) async {
    try {
      final response = await dio.get(
        '$baseUrl/moods/$moodId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return MoodDetailsModel.fromJson(response.data);
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
