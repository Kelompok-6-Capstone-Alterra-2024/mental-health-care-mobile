import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';

class StoryTab extends StatelessWidget {
  const StoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23.5),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.STORY);
            },
            child: Container(
              height: 112,
              width: 380,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(15),
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
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Menemukan Pelangi Setelah Hujan',
                                style: semiBold.copyWith(
                                  fontSize: 16,
                                  color: Neutral.dark1,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Gap(15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'By: Rina Irawan',
                                    style: regular.copyWith(
                                      fontSize: 10,
                                      color: Neutral.dark3,
                                    ),
                                  ),
                                  Text(
                                    '3 Jam yang lalu',
                                    style: regular.copyWith(
                                      fontSize: 10,
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
            ),
          );
        },
      ),
    );
  }
}
