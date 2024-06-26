import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/meditation_controller.dart';
import '../controllers/story_controller.dart';
import 'widget/widget_detail_story.dart';

class StoryView extends GetView<StoryController> {
  const StoryView({super.key});
  @override
  Widget build(BuildContext context) {
    final meditasiC = Get.put(MeditationController());
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
            meditasiC.fetchStorys();
            Get.back();
          },
          padding: const EdgeInsets.only(
            left: 16,
          ),
          splashColor: Neutral.transparent,
          highlightColor: Neutral.transparent,
        ),
        title: Text(
          'Cerita Inspiratif',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.5,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 16,
                        ),
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
                          children: [
                            Container(
                              height: 231,
                              width: 347,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(controller.image.value),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Gap(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.title.value,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: semiBold.copyWith(
                                              fontSize: 16,
                                              color: Neutral.dark1,
                                            ),
                                          ),
                                          const Gap(8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'By: ${controller.author.value}',
                                                style: regular.copyWith(
                                                  fontSize: 12,
                                                  color: Primary.mainColor,
                                                ),
                                              ),
                                              Text(
                                                controller.date.value,
                                                style: regular.copyWith(
                                                  fontSize: 12,
                                                  color: Primary.mainColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Gap(20),
                                    GestureDetector(
                                      onTap: () {
                                        controller.toggleLikeStatus();
                                      },
                                      child: SvgPicture.asset(
                                        controller.isLiked.value
                                            ? 'assets/icons/Union.svg'
                                            : 'assets/icons/Heart.svg',
                                        width: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(16),
                                Text(
                                  controller.content.value,
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.ltr,
                                  style: regular.copyWith(
                                    fontSize: 15,
                                    color: Neutral.dark1,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Gap(32),
                      Text(
                        'Temukan Cerita Inspirasi lainnya',
                        style: semiBold.copyWith(
                          fontSize: 16,
                          color: Primary.darker,
                        ),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 400,
                  ),
                  child: const WidgetDetailStory(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
