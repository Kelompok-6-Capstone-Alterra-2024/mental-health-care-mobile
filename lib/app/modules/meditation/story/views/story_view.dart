import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../../views/TabBarViews/story.dart';
import '../controllers/story_controller.dart';

class StoryView extends GetView<StoryController> {
  const StoryView({Key? key}) : super(key: key);
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
          'Story Meditation',
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
                            Gap(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.title.value,
                                  textAlign: TextAlign.left,
                                  style: semiBold.copyWith(
                                    fontSize: 16,
                                    color: Neutral.dark1,
                                  ),
                                ),
                                Gap(8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'By: ${controller.author.value}',
                                          style: regular.copyWith(
                                            fontSize: 12,
                                            color: Primary.mainColor,
                                          ),
                                        ),
                                        Gap(10),
                                        Text(
                                          controller.date.value,
                                          style: regular.copyWith(
                                            fontSize: 12,
                                            color: Primary.mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.toggleLikeStatus();
                                      },
                                      child: SvgPicture.asset(
                                        controller.isLiked.value
                                            ? 'assets/icons/Union.svg'
                                            : 'assets/icons/Heart.svg',
                                        width: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(16),
                                Text(
                                  controller.content.value,
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
                      Gap(32),
                      Text(
                        'Temukan Cerita Inspirasi lainnya',
                        style: semiBold.copyWith(
                          fontSize: 16,
                          color: Primary.darker,
                        ),
                      ),
                      Gap(16),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 400, // Set a max height for the list view
                  ),
                  child: StoryTab(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
