import 'dart:async';
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
  RxInt lastMessageId = 0.obs;
  var errorMessage = ''.obs;

  Timer? _timer;

  Future<void> loadMessages(int chatId) async {
    try {
      isLoading(true);
      final messageHistory = await messageService.getAllMessages(chatId);
      print('Data received: ${messageHistory.data}');
      if (messageHistory.status) {
        if (messageHistory.data.isNotEmpty) {
          allMessages.addAll(messageHistory.data);
          lastMessageId.value = messageHistory.data.last.id;
        } else {
          allMessages.clear();
          lastMessageId.value = 0;
        }
        print('Messages added: ${allMessages.length}');
        startPolling(chatId); // Start polling after initial load
      } else {
        errorMessage('Failed to load messages');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // void startLoadingMessages(int chatId) {
  //   _timer = Timer.periodic(Duration(seconds: 5), (timer) {
  //     loadMessages(chatId);
  //     update(['chat']);
  //   });
  // }

  void stopLoadingMessages() {
    _timer?.cancel();
  }

  Future<void> sendMessage(int chatId) async {
    String message = messageController.text.trim();
    if (message.isEmpty) return;

    try {
      final newMessage = await messageService.sendMessage(chatId, message);
      allMessages.add(newMessage);
      lastMessageId.value = newMessage.id;
      messageController.clear();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void startPolling(int chatId) {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchNewMessages(chatId);
    });
  }

  Future<void> fetchNewMessages(int chatId) async {
    try {
      if (lastMessageId.value != 0) {
        final newMessages =
            await messageService.getNewMessages(chatId, lastMessageId.value);
        if (newMessages.status) {
          if (newMessages.data.isNotEmpty) {
            allMessages.addAll(newMessages.data);
            lastMessageId.value = newMessages.data.last.id;
          }
        }
      }
    } catch (e) {
      print("Error fetching new messages: $e");
    }
  }

  void stopPolling() {
    lastMessageId.value = 0;
    lastMessageId.close();
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
