import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../../data/api/api.dart';
import '../models/message_history_model.dart';

class MessageService {
  final dio = Dio();
  final logger = Logger();
  final token = GetStorage().read('token');
  final baseUrl = BaseUrl;

  Future<MessageData> sendMessage(int chatId, String message) async {
    print('chatId: $chatId');
    print('message: $message');
    try {
      final response = await dio.post(
        '$baseUrl/chats/messages',
        data: {
          "chat_id": chatId,
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
        return MessageData.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MessageHistory> getAllMessages(int chatId) async {
    try {
      final response = await dio.get(
        '$baseUrl/chats/$chatId/messages?page=1&limit=10',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return MessageHistory.fromJson(response.data);
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
