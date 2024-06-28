import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/chatwithdoctor_controller.dart';
import '../../../../../constant/constant.dart';
import 'components/chat_item.dart';
import 'components/note_item.dart';
import 'components/session_completed.dart';

class ChatwithdoctorView extends GetView<ChatwithdoctorController> {
  const ChatwithdoctorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
            controller.allMessages.clear();
            controller.onClose();
            print(controller.statusChat.value);
          },
        ),
        title: Obx(
          () => Text(
            controller.doctorName.value,
            style: medium.copyWith(fontSize: 16, color: Primary.darker),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              } else {
                print('Displaying messages: ${controller.allMessages.length}');
                return ListView.builder(
                  itemCount: controller.allMessages.length,
                  itemBuilder: (context, index) {
                    var message = controller.allMessages[index];
                    return ChatItem(
                      isSender: message.role == 'user',
                      chat: message.message,
                    );
                  },
                );
              }
            }),
          ),
          Obx(
            () => controller.statusChat.value == 'completed'
                ? Column(
                    children: [
                      SessionCompleted(
                        time: DateFormat.Hm().format(
                            DateTime.parse(controller.endChatTime.value)),
                      ),
                      NoteItem(
                        date: DateFormat.yMMMd().format(
                            DateTime.parse(controller.endChatTime.value)),
                        time: DateFormat.Hm().format(
                            DateTime.parse(controller.endChatTime.value)),
                        onTap: () async {
                          await controller.getConsultationNoteData(
                              controller.idRoomChat.value);
                          Get.toNamed(Routes.DETAILNOTE);
                        },
                      )
                    ],
                  )
                : const SizedBox(),
          ),
          Obx(() {
            if (controller.statusChat.value == 'completed') {
              return const SizedBox();
            } else {
              return Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        controller: controller.messageController,
                        decoration: primary.copyWith(
                          hintText: 'Tulis pesan',
                          hintStyle: regular.copyWith(
                              fontSize: 16, color: Neutral.dark3),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Material(
                      borderRadius: BorderRadius.circular(100),
                      color: Primary.mainColor,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          controller.sendMessage(controller.idRoomChat.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset('assets/icons/Send-icon.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          })
        ],
      ),
    );
  }
}


// Obx(
//                   () => controller.statusChat.value == 'completed'
//                       ? const Column(
//                           children: [
//                             SessionCompleted(
//                               time: '09:38',
//                             ),
//                             NoteItem(
//                               date: '04 Mei 2024',
//                               time: '09:38',
//                             )
//                           ],
//                         )
//                       : const SizedBox(),
//                 )