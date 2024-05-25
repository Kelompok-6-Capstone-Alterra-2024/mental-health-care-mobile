import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';

class MusicTab extends StatelessWidget {
  const MusicTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.MUSIC);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Music",
              style: semiBold.copyWith(
                fontSize: 16,
                color: Primary.darker,
              ),
            ),
            Gap(16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 94,
                    width: 377,
                    margin: const EdgeInsets.only(bottom: 9),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 11),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 71,
                              width: 71,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Eternal Serenity',
                                    style: semiBold.copyWith(
                                      fontSize: 16,
                                      color: Neutral.dark1,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Gap(8),
                                  Text(
                                    'Luna Grace',
                                    style: regular.copyWith(
                                      fontSize: 12,
                                      color: Neutral.dark3,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //
                              },
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/Heart.svg',
                                  width: 20,
                                ),
                                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
