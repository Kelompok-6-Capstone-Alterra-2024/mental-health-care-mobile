import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../../constant/constant.dart';
import '../../../../../routes/app_pages.dart';
import '../../controllers/detail_forum_controller.dart';
import '../../data/models/posts_model.dart';

// PostCard
class PostCard extends StatelessWidget {
  final AllPost postData;

  const PostCard({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    final DetailForumController controller = Get.find();

    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
      decoration: BoxDecoration(
        color: Neutral.light3,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          blur4,
          blur8,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(postData.user.profilePicture),
                ),
                const Gap(16),
                Text(
                  postData.user.username,
                  style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
              ],
            ),
            const Gap(16),
            Text(
              postData.content,
              style: regular.copyWith(fontSize: 12, color: Neutral.dark1),
            ),
            if (postData.imageUrl.isNotEmpty) ...[
              const Gap(10),
              Image.network(
                postData.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ],
            const Gap(10),
            const Divider(color: Neutral.dark3),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // controller.likePost(postData.id);
                    if (controller.isPostLiked(postData.id)) {
                      controller.unlikePost(postData.id);
                    } else {
                      controller.likePost(postData.id);
                    }
                  },
                  child: Obx(
                    () => Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/like.svg',
                          width: 24,
                          height: 24,
                          color: controller.isPostLiked(postData.id)
                              ? Primary.mainColor
                              : null,
                        ),
                        const Gap(6),
                        Text(
                          'Suka',
                          style: semiBold.copyWith(
                            fontSize: 16,
                            color: controller.isPostLiked(postData.id)
                                ? Primary.mainColor
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.COMMENT_FORUM, arguments: postData.id);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/comment.svg',
                        width: 24,
                        height: 24,
                      ),
                      const Gap(6),
                      Text(
                        'Komentar',
                        style: semiBold.copyWith(
                            fontSize: 16, color: Neutral.dark1),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/share2.svg',
                        width: 24,
                        height: 24,
                      ),
                      const Gap(6),
                      Text(
                        'Bagi',
                        style: semiBold.copyWith(
                            fontSize: 16, color: Neutral.dark1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
