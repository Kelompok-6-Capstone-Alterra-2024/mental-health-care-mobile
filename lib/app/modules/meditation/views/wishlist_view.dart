import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'Meditasi Yang Anda Suka',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/Filter.svg',
              width: 24,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 247,
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 32,
                    ),
                    color: Neutral.light4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Filter',
                          style: semiBold.copyWith(
                            fontSize: 16,
                            color: Neutral.dark1,
                          ),
                        ),
                        Gap(11),
                        Text(
                          'Pilih kategori meditasi',
                          style: regular.copyWith(
                            fontSize: 16,
                            color: Neutral.dark3,
                          ),
                        ),
                        Gap(16),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Neutral.light3,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Neutral.dark2,
                                ),
                              ),
                              child: Text(
                                'Musik',
                                style: medium.copyWith(
                                  fontSize: 12,
                                  color: Neutral.dark2,
                                ),
                              ),
                            ),
                            Gap(8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Neutral.light3,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Neutral.dark2,
                                ),
                              ),
                              child: Text(
                                'Artikel',
                                style: medium.copyWith(
                                  fontSize: 12,
                                  color: Neutral.dark2,
                                ),
                              ),
                            ),
                            Gap(8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Neutral.light3,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Neutral.dark2,
                                ),
                              ),
                              child: Text(
                                'Cerita Inspiratif',
                                style: medium.copyWith(
                                  fontSize: 12,
                                  color: Neutral.dark2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(16),
                        Container(
                          width: double.infinity,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Primary.mainColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Pilih',
                              style: semiBold.copyWith(
                                fontSize: 16,
                                color: Neutral.light4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            padding: const EdgeInsets.only(
              right: 16,
            ),
            splashColor: Neutral.transparent,
            highlightColor: Neutral.transparent,
          ),
        ],
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WhislistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
