import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindease/app/routes/app_pages.dart';

import '../controllers/consultation_controller.dart';
import '../../../../constant/constant.dart';

class PaymentsuccessView extends GetView<ConsultationController> {
  PaymentsuccessView({Key? key}) : super(key: key);
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
          'Konsultasi',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/gambarsuccess.svg'),
            const Gap(32),
            Text(
              'Konsultasi Diterima',
              style: semiBold.copyWith(fontSize: 24, color: Neutral.dark1),
            ),
            const Gap(4),
            Text(
              'Tunggu sebentar, kamu akan segera terhubung dengan',
              style: medium.copyWith(fontSize: 12, color: Neutral.dark2),
            ),
            const Gap(4),
            Text(
              'Dr. Andy Sp.KJ',
              style: semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
            ),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
