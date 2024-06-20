import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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
          },
        ),
        title: Text(
          'Dr. Andy Sp.KJ',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
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
                      )
                    ],
                  )
                : const SizedBox(),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: controller.messageController,
                    decoration: primary.copyWith(
                      hintText: 'Tulis pesan',
                      hintStyle:
                          regular.copyWith(fontSize: 16, color: Neutral.dark3),
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
          ),
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