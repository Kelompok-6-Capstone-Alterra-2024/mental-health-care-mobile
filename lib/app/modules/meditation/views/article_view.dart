import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../controllers/meditation_controller.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    final MeditationController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/Chevron Left.svg',
              width: 24,
            ),
            constraints: const BoxConstraints(
              minWidth: 50,
            ),
            onPressed: () {
              Get.back();
            },
            padding: const EdgeInsets.only(
              left: 16,
            ),
            splashColor: Neutral.transparent,
            highlightColor: Neutral.transparent,
          ),
          title: Obx(
            () => Text(
              '${controller.tabNameTitle}',
              style: medium.copyWith(fontSize: 16, color: Primary.darker),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.5,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 252,
                width: 379,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(16),
              Text(
                'Panduan Lengkap untuk Meditasi Harian',
                style: semiBold.copyWith(
                  fontSize: 16,
                  color: Neutral.dark1,
                ),
              ),
              Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '3 Jam yang lalu',
                    style: regular.copyWith(
                      fontSize: 12,
                      color: Primary.mainColor,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/Heart.svg',
                    width: 18,
                  ),
                ],
              ),
              Gap(16),
              Text(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: regular.copyWith(
                  fontSize: 12,
                  color: Neutral.dark1,
                ),
              ),
            ],
          ),
        ));
  }
}
