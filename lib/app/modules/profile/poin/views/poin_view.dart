import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../controllers/poin_controller.dart';

class PoinView extends GetView<PoinController> {
  PoinView({Key? key}) : super(key: key);

  final PoinController pointController = Get.put(PoinController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Point',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Primary.mainColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Coin.svg',
                          width: 47,
                        ),
                        Gap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Point Anda',
                              style: regular.copyWith(
                                  fontSize: 16, color: Neutral.light4),
                            ),
                            Text(
                              pointController.point.value.data.points
                                  .toString(),
                              style: semiBold.copyWith(
                                  fontSize: 24, color: Neutral.light4),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(24),
                  Text(
                    'History Point',
                    style:
                        semiBold.copyWith(fontSize: 16, color: Primary.darker),
                  ),
                  const Gap(16),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 24),
                        decoration: BoxDecoration(
                            color: Neutral.light4,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [blur4, blur8]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hari Ini',
                              style: regular.copyWith(fontSize: 12),
                            ),
                            const Gap(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Transaksi Berhasil',
                                  style: semiBold.copyWith(fontSize: 16),
                                ),
                                Text(
                                  '+100 Points',
                                  style: semiBold.copyWith(
                                      fontSize: 16, color: Success.mainColor),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
