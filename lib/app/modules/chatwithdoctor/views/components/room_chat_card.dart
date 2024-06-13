import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/app/routes/app_pages.dart';

import '../../../../../constant/constant.dart';
import '../../../../../utils/global_components/main_button.dart';

class RoomChatCard extends StatelessWidget {
  const RoomChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Dr. Andy Sp.KJ',
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
                                'Sp. Jiwa',
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
                            'Konsultasi Berlangsung',
                            style: semiBold.copyWith(
                              fontSize: 12,
                              color: Neutral.dark2,
                            ),
                          ),
                          BookButton(
                            label: 'chat',
                            onTap: () {
                              Get.toNamed(Routes.CHATWITHDOCTOR);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 142,
            decoration: BoxDecoration(
              color: Neutral.transparent, //Neutral.light4..withOpacity(0.5)
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
