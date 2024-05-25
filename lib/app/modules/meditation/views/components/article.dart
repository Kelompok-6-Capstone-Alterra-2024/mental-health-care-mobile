import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';

class ArticleTab extends StatelessWidget {
  const ArticleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ARTICLE);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 123,
              width: 380,
              margin: const EdgeInsets.only(bottom: 16),
              // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Neutral.dark4,
                  width: 0.2,
                ),
                color: Neutral.light4,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  blur4,
                  blur8,
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 122,
                        width: 142,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 17,
                            right: 14,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Panduan Lengkap untuk Meditasi Harian',
                                style: semiBold.copyWith(
                                  fontSize: 16,
                                  color: Neutral.dark1,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Gap(16),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Calendar.svg',
                                    width: 12,
                                    color: Neutral.dark3,
                                  ),
                                  Gap(8),
                                  Text(
                                    '12 Mei 2024',
                                    style: regular.copyWith(
                                      fontSize: 12,
                                      color: Neutral.dark3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
