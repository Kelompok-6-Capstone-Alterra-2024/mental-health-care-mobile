import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/routes/app_pages.dart';

import '../../../../../constant/constant.dart';

class NoteItem extends StatelessWidget {
  final String date;
  final String time;
  const NoteItem({
    super.key,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [blur8, blur4],
                borderRadius: BorderRadius.circular(8),
                color: Neutral.light4,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Catatan Konsultasi',
                        style: semiBold.copyWith(
                          fontSize: 16,
                          color: Neutral.dark1,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Dikirim ',
                            style: regular.copyWith(
                              fontSize: 12,
                              color: Success.mainColor,
                            ),
                          ),
                          Text(
                            'pada $date, $time',
                            style: regular.copyWith(
                              fontSize: 12,
                              color: Neutral.dark2,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      const Divider(
                        height: 1,
                      ),
                    ],
                  ),
                  const Gap(8),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith<
                          EdgeInsetsGeometry?>(
                        (Set<MaterialState> states) {
                          return EdgeInsets.all(0);
                        },
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.DETAILNOTE);
                    },
                    child: Text(
                      'Lihat Detail >',
                      style: semiBold.copyWith(
                        fontSize: 12,
                        color: Primary.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
