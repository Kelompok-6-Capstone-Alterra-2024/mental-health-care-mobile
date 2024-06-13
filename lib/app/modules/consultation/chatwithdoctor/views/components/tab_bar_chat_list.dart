import 'package:flutter/material.dart';

import '../../../../../../constant/constant.dart';


class TabBarChatList extends StatelessWidget {
  const TabBarChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
    );
  }
}
