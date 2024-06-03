import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/constant/constant.dart';

import '../controllers/notification_controller.dart';
import 'components/notification_card.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationCard(
              message:
                  'Waktunya untuk konsultasi! Jadwalkan sesi dengan psikiater Anda sekarang untuk mendapatkan dukungan yang Anda butuhkan.',
                  time: 'baru saja',
              textColor: Neutral.dark1,
              status: Primary.mainColor,
              backgroundColor: Neutral.light3,
            ),
            NotificationCard(
              message:
                  'Waktunya untuk konsultasi! Jadwalkan sesi dengan psikiater Anda sekarang untuk mendapatkan dukungan yang Anda butuhkan.',
                  time: '1 jam lalu',
              textColor: Neutral.dark3,
              status: Neutral.dark3,
              backgroundColor: Neutral.light3,
            ),

          ],
        ),
      ),
    );
  }
}
