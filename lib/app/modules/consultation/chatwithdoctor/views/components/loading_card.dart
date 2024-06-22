import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../constant/constant.dart';
import '../../../../../../utils/global_components/book_button.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: double.infinity,
        height: 142,
        decoration: BoxDecoration(
          boxShadow: [blur8, blur4],
          color: Neutral.light4,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 63,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Neutral.dark4,
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
                              'name',
                              style: medium.copyWith(
                                  fontSize: 16, color: Neutral.dark1),
                            ),
                            Text(
                              '19:22',
                              style: medium.copyWith(
                                  fontSize: 12, color: Neutral.dark3),
                            ),
                          ],
                        ),
                        Text(
                          "pecialist",
                          style: regular.copyWith(
                              fontSize: 12, color: Neutral.dark2),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Gap(10),
              Divider(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "tatus",
                      style: semiBold.copyWith(
                        fontSize: 12,
                        color: Neutral.dark3,
                      ),
                    ),
                    BookButton(
                      label: 'chat',
                      backgroundColor: Neutral.dark4,
                      textColor: Neutral.dark3,
                      onTap: () {
                        // Get.toNamed(Routes.CHATWITHDOCTOR);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
