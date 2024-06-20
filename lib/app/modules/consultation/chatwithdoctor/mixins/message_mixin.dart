import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/data/models/message_history_model.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/data/models/message_model.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/data/services/message_service.dart';

mixin MessageMixin on GetxController {
  final TextEditingController messageController = TextEditingController();
  final messageService = MessageService();

  RxInt idRoomChat = 0.obs;
  RxBool isLoading = true.obs;
  RxList<Data> messages = <Data>[].obs;
  RxList<MessageData> allMessages = <MessageData>[].obs;

  Future<void> loadMessages(int chatId) async {
    try {
      isLoading(true);
      final messageHistory = await messageService.getAllMessages(chatId);
      if (messageHistory.status) {
        allMessages.addAll(messageHistory.data);
      } else {
        Get.snackbar('Error', 'Failed to load messages');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> sendMessage(int chatId) async {
    String message = messageController.text.trim();
    if (message.isEmpty) return;
    try {
      final newMessage = await messageService.sendMessage(chatId, message);
      allMessages.add(newMessage);
      messageController.clear();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Future<void> sendMessage() async {
  //   String message = messageController.text;
  //   if (message.isEmpty) return;
  //   try {
  //     final response =
  //         await messageService.sendMessage(idRoomChat.value, message);

  //     if (response.statusCode == 201) {
  //       final messageModel = MessageModel.fromJson(response.data);
  //       if (messageModel.status) {
  //         messages.add(messageModel.data);
  //         messageController.clear();
  //       } else {
  //         Get.snackbar('Error', 'Failed to send message');
  //       }
  //     } else {
  //       Get.snackbar('Error', 'Failed to send message');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }
}
