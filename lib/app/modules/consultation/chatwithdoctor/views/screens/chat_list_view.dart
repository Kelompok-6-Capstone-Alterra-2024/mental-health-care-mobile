import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/views/screens/tab_bar_rooms_chat/active_rooms_chat.dart';
import 'package:mindease/app/modules/consultation/chatwithdoctor/views/screens/tab_bar_rooms_chat/process_rooms_chat.dart';

import '../../../../../../constant/constant.dart';
import '../../controllers/chatwithdoctor_controller.dart';
import '../components/tab_bar_chat_list.dart';
import 'tab_bar_rooms_chat/all_rooms_chat.dart';
import 'tab_bar_rooms_chat/complected_rooms_chat.dart';

class ChatListView extends GetView<ChatwithdoctorController> {
  const ChatListView({Key? key}) : super(key: key);
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
          },
        ),
        title: Text(
          'Daftar Chat',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: primary.copyWith(
                hintText: 'Temukan Psikiater',
                hintStyle: regular.copyWith(fontSize: 16, color: Neutral.dark3),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset(
                      'assets/icons/Search.svg',
                    ),
                  ),
                ),
              ),
            ),
            const Gap(16),
            const Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBarChatList(),
                    Gap(16),
                    Expanded(
                      child: TabBarView(
                        children: [
                          AllRoomsChat(),
                          //active chat
                          ActiveRoomsChat(),
                          //proses chat
                          ProcessRoomsChat(),
                          //selesai chat
                          ComplectedRoomsChat(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
