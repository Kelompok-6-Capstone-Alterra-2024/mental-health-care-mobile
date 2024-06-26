import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_socket_channel/io.dart';
import '../../../../../constant/constant.dart';
import '../data/model/message_model.dart';

class AiChatController extends GetxController {
  Rx<DateTime> currentTime = DateTime.now().obs;
  RxList<MessageModel> messages = <MessageModel>[].obs;
  late IOWebSocketChannel channel;
  RxString token = ''.obs;
  RxBool isConnected = false.obs;
  RxString errorMessage = ''.obs;

  TextEditingController messageController = TextEditingController();

  late Timer _timer;
  final storage = GetStorage();

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentTime.value = DateTime.now();
    });
  }

  void connectWebSocket() {
    try {
      channel = IOWebSocketChannel.connect(
          'ws://dev-capstone.practiceproject.tech/v1/users/chatbots/customer-service?token=${token.value}');
      isConnected.value = true;

      channel.stream.listen(
        (message) {
          final parsedMessage = MessageModel(
            text: message,
            isMine: false,
          );
          messages.add(parsedMessage);
          saveMessages();
        },
        onDone: () {
          isConnected.value = false;
          reconnectWebSocket();
        },
        onError: (error) {
          errorMessage.value = error.toString();
        },
      );
    } catch (e) {
      isConnected.value = false;
      print('WebSocket exception: $e');
      reconnectWebSocket();
    }
  }

  void reconnectWebSocket() {
    Future.delayed(Duration(seconds: 5), () {
      if (!isConnected.value) {
        connectWebSocket();
      }
    });
  }

  void sendMessage(String messageText) {
    final message = MessageModel(
      text: messageText,
      isMine: true,
    );
    messages.add(message);
    saveMessages();
    channel.sink.add(messageText);
    messageController.clear();
  }

  void loadMessages() { //load messages from local storage
    List<dynamic>? storedMessages = storage.read<List<dynamic>>('messages');
    if (storedMessages != null) {
      messages.value = storedMessages.map((e) => MessageModel.fromJson(e)).toList();
    }
  }

  void saveMessages() { // Save messages to local storage save with json format
    List<Map<String, dynamic>> messageList = messages.map((e) => e.toJson()).toList();
    storage.write('messages', messageList);
  }

  void clearMessages() {
    messages.clear();
    storage.remove('messages');
  }

  @override
  void onInit() {
    token.value = GetStorage().read('token');
    startTimer();
    loadMessages();
    connectWebSocket();
    super.onInit();
  }

  @override
  void onClose() {
    try {
      if (isConnected.value) {
        channel.sink.close(1000); 
      }
    } catch (e) {
      print('Error closing WebSocket: $e');
    } finally {
      isConnected.value = false;
    }
    Get.closeAllSnackbars(); 
    super.onClose();
  }
}
