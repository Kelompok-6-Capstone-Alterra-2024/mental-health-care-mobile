import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../../data/api/api.dart';
import '../models/chat_rooms_model.dart';

class ChatRoomsService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<ChatRoomsModel> getChatRooms({String filter = '', int page = 1, int limit = 10}) async {
    try {
      final response = await dio.get(
        '$baseUrl/chats?page=$page&limit=$limit$filter',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return ChatRoomsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
