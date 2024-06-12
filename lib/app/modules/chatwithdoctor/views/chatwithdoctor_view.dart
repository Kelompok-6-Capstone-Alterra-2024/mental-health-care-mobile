import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/chatwithdoctor_controller.dart';
import '../../../../constant/constant.dart';
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
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset('assets/icons/Back_Left.svg'),
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
            child: ListView(
              children: const [
                ChatItem(
                  isSender: true,
                  chat: 'Rorem ipsum dolor sit adipiscing elit.',
                ),
                ChatItem(
                  isSender: false,
                  chat: 'Rorem ipsum dolor sit adipiscing elit.',
                ),
                ChatItem(
                  isSender: true,
                  chat: 'Rorem ipsum dolor sit adipiscing elit.',
                ),
                ChatItem(
                  isSender: false,
                  chat:
                      'Rorem ipsum dolor sit adipiscing elit.Rorem ipsum dolor sit adipiscing elit.Rorem ipsum dolor sit adipiscing elit.',
                ),
                SessionCompleted(
                  time: '09:38',
                ),
                NoteItem(
                  date: '04 Mei 2024',
                  time: '09:38',
                )
              ],
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
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
                    onTap: () {},
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
