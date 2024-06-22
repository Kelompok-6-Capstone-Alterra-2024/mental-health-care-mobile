import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';
import '../../controllers/meditation_controller.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

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
            meditasiC.fetchArticles();
            Get.back();
          },
          padding: const EdgeInsets.only(
            left: 16,
          ),
          splashColor: Neutral.transparent,
          highlightColor: Neutral.transparent,
        ),
        title: Text(
          'Artikel Meditasi',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.5,
          vertical: 32,
        ),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 252,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(controller.image.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.title.value,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: semiBold.copyWith(
                              fontSize: 16,
                              color: Neutral.dark1,
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
                    ),
                    const Gap(8),
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
                    fontSize: 12,
                    color: Neutral.dark1,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
