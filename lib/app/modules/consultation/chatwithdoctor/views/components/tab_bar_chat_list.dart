import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constant/constant.dart';
import '../../controllers/chatwithdoctor_controller.dart';

class TabBarChatList extends StatelessWidget {
  const TabBarChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatwithdoctorController());
    return TabBar(
      onTap: (index) {
        switch (index) {
          case 0:
            controller.updateFilter('');
            break;
          case 1:
            controller.updateFilter('&status=active');
            break;
          case 2:
            controller.updateFilter('&status=process');
            break;
          case 3:
            controller.updateFilter('&status=completed');
            break;
        }
      },
      isScrollable: false,
      dividerHeight: 0,
      labelStyle: medium.copyWith(fontSize: 16, color: Primary.mainColor),
      unselectedLabelStyle: medium.copyWith(fontSize: 16, color: Neutral.dark3),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.0, color: Primary.mainColor),
      ),
      tabs: const [
        Tab(text: 'Semua'),
        Tab(text: 'Aktif'),
        Tab(text: 'Proses'),
        Tab(text: 'Selesai'),
      ],
    );
  }
}
