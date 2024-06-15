import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/forum_controller.dart';
import 'components/my_forum_card.dart';
import 'components/forum_card.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Forum',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              TextFormField(
                style: light.copyWith(fontSize: 14, color: Neutral.dark3),
                decoration: searchStyle.copyWith(
                    hintText: 'Temukan Forum',
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/Search.svg',
                      width: 20,
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 50)),
              ),
              const Gap(32),
              Text(
                'Forum Saya',
                style:
                    semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(child: Text(controller.errorMessage.value));
                } else {
                  return SizedBox(
                    height: Get.height * 0.28,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.joinedForums.length,
                      itemBuilder: (context, index) {
                        final forum = controller.joinedForums[index];
                        return MyForumCard(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_FORUM,
                                arguments: forum.forumId);
                          },
                          title: forum.name,
                          imageUrl: forum.imageUrl,
                        );
                      },
                    ),
                  );
                }
              }),
              const Gap(16),
              Text(
                'Rekomendasi Forum',
                style:
                    semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(child: Text(controller.errorMessage.value));
                } else {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.recommendationForums.length,
                    itemBuilder: (context, index) {
                      final forum = controller.recommendationForums[index];
                      return ForumCard(
                        title: forum.name,
                        imageUrl: forum.imageUrl,
                        numberOfMembers: forum.numberOfMembers,
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
