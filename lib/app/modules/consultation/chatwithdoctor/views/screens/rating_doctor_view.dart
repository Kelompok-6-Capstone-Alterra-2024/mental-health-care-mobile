// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../../../../../../constant/constant.dart';
import '../../controllers/chatwithdoctor_controller.dart';

class RatingDoctorView extends GetView<ChatwithdoctorController> {
  const RatingDoctorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Rating & Review',
          style: medium.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 222,
                    height: 222,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(controller.doctorImgUrl.value == ''
                            ? 'https://wallpapers.com/images/hd/doctor-pictures-l5y1qs2998u7rf0x.jpg'
                            : controller.doctorImgUrl.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Text(
                    controller.doctorName.value,
                    style: bold.copyWith(
                      fontSize: 16,
                      color: Primary.mainColor,
                    ),
                  ),
                  Text(
                    controller.doctorSpecialist.value == ''
                        ? 'Doctor Specialist'
                        : controller.doctorSpecialist.value,
                    style: medium.copyWith(
                      fontSize: 12,
                      color: Neutral.dark3,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Center(
              child: RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                unratedColor: Neutral.dark4,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Warning.mainColor,
                ),
                onRatingUpdate: (rating) {
                  controller.setRate(rating.toInt());
                },
              ),
            ),
            const Gap(32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesan',
                  style: medium.copyWith(
                    fontSize: 16,
                    color: Neutral.dark1,
                  ),
                ),
                const Gap(10),
                TextField(
                  onChanged: (value) {
                    controller.setMessage(value);
                  },
                  maxLines: 5,
                  decoration: textBoxStyle.copyWith(
                    hintText: 'Masukan pesan untuk psikiater',
                    hintStyle:
                        regular.copyWith(fontSize: 16, color: Neutral.dark3),
                  ),
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            Gap(32),
            MainButton(
              label: 'Kirim',
              onTap: () {
                controller.createFeedback(
                  controller.rate.value,
                  controller.message.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
