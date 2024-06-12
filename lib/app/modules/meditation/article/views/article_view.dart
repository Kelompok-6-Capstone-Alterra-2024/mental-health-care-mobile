import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

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
          'Meditation View',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.5,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Container(
                height: 252,
                width: 379,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn-2.tstatic.net/bali/foto/bank/images/ilustrasi-meditasi.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Gap(16),
            Obx(() {
              return Text(
                controller.articleTitle.value,
                style: semiBold.copyWith(
                  fontSize: 16,
                  color: Neutral.dark1,
                ),
              );
            }),
            Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return Text(
                    controller.articleCreatedAt.value,
                    style: regular.copyWith(
                      fontSize: 12,
                      color: Primary.mainColor,
                    ),
                  );
                }),
                SvgPicture.asset(
                  'assets/icons/Heart.svg',
                  width: 18,
                ),
              ],
            ),
            Gap(16),
            Obx(() {
              return Text(
                controller.articleContent.value,
                style: regular.copyWith(
                  fontSize: 12,
                  color: Neutral.dark1,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
