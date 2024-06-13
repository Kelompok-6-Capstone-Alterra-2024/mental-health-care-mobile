import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          'Article View',
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
          if (controller.articleTitle.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
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
                      image: NetworkImage(
                          "https://cdn-2.tstatic.net/bali/foto/bank/images/ilustrasi-meditasi.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(16),
                Text(
                  controller.articleTitle.value,
                  style: semiBold.copyWith(
                    fontSize: 16,
                    color: Neutral.dark1,
                  ),
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.articleCreatedAt.value,
                      style: regular.copyWith(
                        fontSize: 12,
                        color: Primary.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isLiked.value = !controller.isLiked.value;
                      },
                      child: SvgPicture.asset(
                        controller.isLiked.value
                            ? 'assets/icons/Heart_filled.svg'
                            : 'assets/icons/Heart.svg',
                        width: 18,
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                Text(
                  controller.articleContent.value,
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
