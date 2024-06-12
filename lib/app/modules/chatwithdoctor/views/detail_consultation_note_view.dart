// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../../../../constant/constant.dart';
import '../controllers/chatwithdoctor_controller.dart';
import 'components/other_service_cards.dart';

class DetailConsultationNoteView extends GetView<ChatwithdoctorController> {
  const DetailConsultationNoteView({Key? key}) : super(key: key);
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
          'Catatan Konsultasi',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
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
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Avatar1.png'),
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
                            'Dr. Andy Sp.KJ',
                            style: medium.copyWith(
                                fontSize: 16, color: Neutral.dark1),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.DETAILPSIKIATER);
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
                        'Sp. Jiwa',
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
                        const OtherServiceCards(
                          image: 'assets/images/mood_profile.png',
                          featureName: 'Mood Tracker',
                          title: 'Lacak suasana Hati',
                        ),
                        const OtherServiceCards(
                          image: 'assets/images/meditasi_profile.png',
                          featureName: 'Meditasi Audio',
                          title: 'Suara Lautan',
                        ),
                        const OtherServiceCards(
                          image: 'assets/images/forum_profile.png',
                          featureName: 'Forum dan Komunitas',
                          title: 'TalkLife',
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
                  'Rasa cemas terus menerus',
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
                  'Konsultasi 3 minggu kedepan',
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
                  'Istirahat lebih cepat',
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
            MainButton(
              label: 'Tambahakan Review',
              onTap: () {
                Get.toNamed(Routes.RATINGDOCTOR);
              },
            ),
          ],
        ),
      ),
    );
  }
}
