import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/utils/helper/status_room_chat.dart';
import '../../../controllers/chatwithdoctor_controller.dart';
import '../../components/room_chat_card.dart';

class ProcessRoomsChat extends StatelessWidget {
  const ProcessRoomsChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatwithdoctorController());
    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshData();
      },
      child: Obx(() {
        if (controller.infoList.isEmpty && controller.isLoadingMore.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.infoList.isEmpty) {
          return const Center(
            child: Text(
              'Data Kosong',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        } else {
          return ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.hasMoreData.value
                ? controller.infoList.length + 1
                : controller.infoList.length,
            itemBuilder: (context, index) {
              if (index < controller.infoList.length) {
                final info = controller.infoList[index];
                return RoomChatCard(
                  urlImage: info.doctor.imageUrl == 'http://gambar.com' ||
                          info.doctor.imageUrl == 'ini link fotonya' ||
                          info.doctor.imageUrl == ''
                      ? 'https://wallpapers.com/images/hd/doctor-pictures-l5y1qs2998u7rf0x.jpg'
                      : info.doctor.imageUrl,
                  name: info.doctor.name,
                  specialist: info.doctor.specialist,
                  isRejected: info.isRejected,
                  status: statusRoomChat(info.status),
                  bgBadgeStatus: bgBadgeStatus(info.status),
                  textBadgeStatus: textBadgeStatus(info.status),
                  onTap: controller.onChatStatus(info.status,
                      isRejected: info.isRejected,
                      roomChatId: info.id,
                      endTime: info.endTime),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }
      }),
    );
  }
}
