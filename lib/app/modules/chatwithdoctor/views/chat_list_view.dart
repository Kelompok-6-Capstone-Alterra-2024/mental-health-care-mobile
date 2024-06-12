import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../../utils/global_components/main_button.dart';
import '../controllers/chatwithdoctor_controller.dart';
import 'components/room_chat_card.dart';

class ChatListView extends GetView<ChatwithdoctorController> {
  const ChatListView({Key? key}) : super(key: key);
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
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: false,
                      dividerHeight: 0,
                      labelStyle: medium.copyWith(
                          fontSize: 16, color: Primary.mainColor),
                      unselectedLabelStyle:
                          medium.copyWith(fontSize: 16, color: Neutral.dark3),
                      indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2.0, color: Primary.mainColor),
                      ),
                      tabs: const [
                        Tab(text: 'Semua'),
                        Tab(text: 'Aktif'),
                        Tab(text: 'Proses'),
                        Tab(text: 'Selesai'),
                      ],
                    ),
                    Gap(16),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            children: [
                              RoomChatCard(),
                            ],
                          ),
                          ListView(
                            children: [
                              Center(
                                child: Text('2'),
                              )
                            ],
                          ),
                          ListView(
                            children: [
                              Center(
                                child: Text('3'),
                              )
                            ],
                          ),
                          ListView(
                            children: [
                              Center(
                                child: Text('4'),
                              )
                            ],
                          ),
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
