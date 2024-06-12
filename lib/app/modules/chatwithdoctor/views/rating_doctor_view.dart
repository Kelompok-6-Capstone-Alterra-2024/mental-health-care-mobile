// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/utils/global_components/main_button.dart';

import '../../../../constant/constant.dart';
import '../controllers/chatwithdoctor_controller.dart';

class RatingDoctorView extends GetView<ChatwithdoctorController> {
  const RatingDoctorView({Key? key}) : super(key: key);
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
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 222,
                    height: 222,
                    decoration: const BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Avatar1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Text(
                    'Dr. Andy Sp.KJ',
                    style: bold.copyWith(
                      fontSize: 16,
                      color: Primary.mainColor,
                    ),
                  ),
                  Text(
                    'Sp. Jiwa',
                    style: medium.copyWith(
                      fontSize: 12,
                      color: Neutral.dark3,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 40,
                    color: Colors.amber,
                  ),
                ],
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
                Gap(10),
                TextField(
                  maxLines: 5,
                  decoration: textBoxStyle.copyWith(
                    hintText: 'Masukan pesan untuk psikiater',
                    hintStyle:
                        regular.copyWith(fontSize: 16, color: Neutral.dark3),
                  ),
                ),
              ],
            ),
            Gap(32),
            MainButton(
              label: 'Kirim',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
