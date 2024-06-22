import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../../data/api/api.dart';

class FeedbackServices extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<void> postFeedback(int doctorId, int rate, String message) async {
    try {
      final response = await dio.post(
        '$baseUrl/feedbacks',
        data: {
          'doctor_id': doctorId,
          'rate': rate,
          'message': message,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 201) {
        logger.i(response.data);
        return response.data;
      } else {
        throw Exception('Failed to post feedback');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
