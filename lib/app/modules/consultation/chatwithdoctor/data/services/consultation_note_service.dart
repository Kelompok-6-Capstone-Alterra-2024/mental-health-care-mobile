import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../../data/api/api.dart';
import '../models/consultation_note_model.dart';

class ConsultationNoteService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<ConsultationNoteModel> getConsultationNote(int chatRoomId) async {
    try {
      final response = await dio.get(
        '$baseUrl/consultation-notes/consultation/$chatRoomId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return ConsultationNoteModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        logger.e(
            'Dio error! Status: ${e.response?.statusCode}, Data: ${e.response?.data}');
        if (e.response?.statusCode == 400) {
          Get.snackbar('Kosong', 'catatan konsultasi kosong');
          throw Exception('Bad request: ${e.response?.data}');
        } else {
          throw Exception('Failed to load data: ${e.response?.statusCode}');
        }
      } else {
        // Handle other Dio errors (e.g., no internet connection)
        logger.e(e.message);
        throw Exception('Failed to load data: ${e.message}');
      }
    } catch (e) {
      // Handle other errors
      logger.e(e.toString());
      throw Exception(e.toString());
    }
  }
}
