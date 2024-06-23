import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mindease/app/modules/home/data/model/allmusic_model.dart';

import '../../../../data/api/api.dart';

class AllmusicServices extends GetxController {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<AllMusicModel> getAllMusic() async {
    try {
      final response = await dio.get(
        '$baseUrl/musics?page=1&limit=3',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return AllMusicModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
