// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button_without_padding.dart';

import '../../../../../../constant/constant.dart';
import '../../controllers/chatwithdoctor_controller.dart';
import '../components/other_service_cards.dart';

class DetailConsultationNoteView extends GetView<ChatwithdoctorController> {
  const DetailConsultationNoteView({Key? key}) : super(key: key);
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
          'Catatan Konsultasi',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 63,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        image: NetworkImage(controller.doctorImgUrl.value == ''
                            ? 'https://wallpapers.com/images/hd/doctor-pictures-l5y1qs2998u7rf0x.jpg'
                            : controller.doctorImgUrl.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.doctorName.value,
                              style: medium.copyWith(
                                  fontSize: 16, color: Neutral.dark1),
                            ),
                            InkWell(
                              onTap: () {
                                // Get.toNamed(Routes.DETAILPSIKIATER);
                              },
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Primary.mainColor),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                child: Text(
                                  'Lihat Profile',
                                  style: medium.copyWith(
                                    fontSize: 12,
                                    color: Primary.mainColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          controller.doctorSpecialist.value,
                          style: regular.copyWith(
                              fontSize: 12, color: Neutral.dark2),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(32),
              SizedBox(
                width: 405,
                height: 236,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rekomendasi Layanan',
                      style: semiBold.copyWith(
                        fontSize: 16,
                        color: Primary.mainColor,
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OtherServiceCards(
                            image: 'assets/images/mood_profile.png',
                            featureName: 'Mood Tracker',
                            title: controller.moodTrack.value,
                          ),
                          OtherServiceCards(
                            image: 'assets/images/meditasi_profile.png',
                            featureName: 'Meditasi Audio',
                            title: controller.musicTitle.value,
                          ),
                          OtherServiceCards(
                            image: 'assets/images/forum_profile.png',
                            featureName: 'Forum dan Komunitas',
                            title: controller.forumName.value,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(32),
              Text(
                'Rangkuman Konsultasi',
                style: semiBold.copyWith(
                  fontSize: 16,
                  color: Primary.mainColor,
                ),
              ),
              const Gap(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.firstPoint.value,
                    style: semiBold.copyWith(
                      fontSize: 16,
                      color: Neutral.dark1,
                    ),
                  ),
                  Text(
                    'Poin Diskusi Utama',
                    style: regular.copyWith(
                      fontSize: 12,
                      color: Neutral.dark3,
                    ),
                  ),
                  const Divider(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.secondPoint.value,
                    style: semiBold.copyWith(
                      fontSize: 16,
                      color: Neutral.dark1,
                    ),
                  ),
                  Text(
                    'Langkah Selanjutnya',
                    style: regular.copyWith(
                      fontSize: 12,
                      color: Neutral.dark3,
                    ),
                  ),
                  const Divider(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.thirdPoint.value,
                    style: semiBold.copyWith(
                      fontSize: 16,
                      color: Neutral.dark1,
                    ),
                  ),
                  Text(
                    'Tambahan',
                    style: regular.copyWith(
                      fontSize: 12,
                      color: Neutral.dark3,
                    ),
                  ),
                  const Divider(),
                ],
              ),
              const Gap(32),
              MainButtonWithoutPadding(
                label: 'Tambahakan Review',
                onTap: () {
                  Get.toNamed(Routes.RATINGDOCTOR);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
