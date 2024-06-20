import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/data/models/chat_rooms_model.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/mixins/message_mixin.dart';

import '../../../../routes/app_pages.dart';
import '../data/services/chat_rooms_service.dart';

class ChatwithdoctorController extends GetxController with MessageMixin {
  final ChatRoomsService _chatRoomsService = ChatRoomsService();
  RxList<Doctor> doctorRoomList = <Doctor>[].obs;
  RxList<Info> infoList = <Info>[].obs;
  RxBool isLoadingMore = false.obs;
  RxBool hasMoreData = true.obs;
  RxString filter = ''.obs;
  RxString statusChat = ''.obs;
  int page = 1;
  int limit = 10;
  RxString endChatTime = ''.obs;

  ScrollController scrollController = ScrollController();

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (maxScroll == currentScroll &&
        hasMoreData.value &&
        !isLoadingMore.value) {
      loadMoreData();
    }
  }

  Future loadInitialData() async {
    print('filter use = ${filter.value}');
    try {
      final chatRooms = await _chatRoomsService.getChatRooms(
          page: page, limit: limit, filter: filter.value);
      final sortedData = chatRooms.data;
      if (sortedData.length < limit) {
        hasMoreData.value = false;
      }
      infoList
          .addAll(sortedData); // Menggunakan addAll untuk menambahkan data baru
      doctorRoomList.addAll(sortedData.map((info) =>
          info.doctor)); // Menggunakan addAll untuk menambahkan data baru
      page++;
    } catch (e) {
      print('Error: $e');
    }
  }

  void loadMoreData() async {
    isLoadingMore.value = true;

    try {
      final chatRooms = await _chatRoomsService.getChatRooms(
          page: page, limit: limit, filter: filter.value);
      List<Info> newSortedData = chatRooms.data;
      if (newSortedData.isEmpty || newSortedData.length < limit) {
        hasMoreData.value = false;
      }

      infoList.addAll(newSortedData);
      doctorRoomList.addAll(newSortedData.map((info) => info.doctor).toList());
      page++;
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future refreshData() async {
    page = 1;
    hasMoreData.value = true;
    infoList.clear(); // Menghapus semua data sebelumnya
    doctorRoomList.clear();
    await loadInitialData();
  }

  void updateFilter(String newFilter) {
    filter.value = newFilter;
    infoList.clear();
    doctorRoomList.clear();
    refreshData();
  }

  Function() onChatStatus(String status, {bool? isRejected, int? roomChatId, String? endTime}) {
    switch (status) {
      case 'active':
        return () {
          Get.toNamed(Routes.CHATWITHDOCTOR);
        };
      case 'process':
        return () {};
      case 'completed':
        //jadi jika statusnya completed dan isRejected false maka akan diarahkan ke chat with doctor
        //dan status chat akan diubah menjadi completed yang berfunsinya untuk menampilkan catatan konsultasi
        if (isRejected == true) {
          //jangan lupa ganti false buat ngakses chat
          return () {
            Get.toNamed(Routes.CHATWITHDOCTOR,);
            changeStatusChat('completed');
            setIdRoomChat(roomChatId!);
            loadMessages(roomChatId);
            setEndTime(endTime!);
          };
        } else {
          return () {};
        }
      default:
        return () {};
    }
  }

  void changeStatusChat(String status) {
    statusChat.value = status;
  }

  void setIdRoomChat(int roomChatId) {
    idRoomChat.value = roomChatId;
  }

  void setEndTime(String endTime) {
    endChatTime.value = endTime;
  }

  @override
  void onInit() {
    super.onInit();
    loadInitialData(); //all data doctor
    scrollController.addListener(onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
