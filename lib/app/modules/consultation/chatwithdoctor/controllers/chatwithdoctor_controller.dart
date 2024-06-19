import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/data/models/chat_rooms_model.dart';

import '../../../../routes/app_pages.dart';
import '../data/services/chat_rooms_service.dart';

class ChatwithdoctorController extends GetxController {
  final ChatRoomsService _chatRoomsService = ChatRoomsService();
  RxList<Doctor> doctorRoomList = <Doctor>[].obs;
  RxList<Info> infoList = <Info>[].obs;
  RxBool isLoadingMore = false.obs;
  RxBool hasMoreData = true.obs;
  RxString filter = ''.obs;
  int page = 1;
  int limit = 10;

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

  Function() onChatStatus(String status) {
    switch (status) {
    case 'active':
      return () {
        Get.toNamed(Routes.CHATWITHDOCTOR);
      };
    case 'process':
      return () {
       
      };
    case 'completed':
      return () {
        Get.toNamed(Routes.CHATWITHDOCTOR, arguments: {'status': status});
      };
    default:
      return () {
       
      };
  }
  }

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
    scrollController.addListener(onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
