import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../constant/constant.dart';
import '../controllers/comment_forum_controller.dart';

class CommentForumView extends GetView<CommentForumController> {
  const CommentForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Komentar',
          style: medium.copyWith(fontSize: 16, color: Primary.darker),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.post.value == null) {
                return const Center(child: Text('Post not found'));
              } else {
                return Container(
                  margin:
                      const EdgeInsets.only(bottom: 16, left: 24, right: 24),
                  decoration: BoxDecoration(
                    color: Neutral.light3,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [blur4, blur8],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(controller
                                  .post.value!.data.user.profilePicture),
                            ),
                            const Gap(16),
                            Text(
                              controller.post.value!.data.user.username,
                              style: semiBold.copyWith(
                                  fontSize: 16, color: Neutral.dark1),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Text(
                          controller.post.value!.data.content,
                          style: regular.copyWith(
                              fontSize: 12, color: Neutral.dark1),
                        ),
                        if (controller
                            .post.value!.data.imageUrl.isNotEmpty) ...[
                          const Gap(10),
                          Image.network(
                            controller.post.value!.data.imageUrl,
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
                                controller.toggleLikeButton();
                              },
                              child: Obx(() {
                                return Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/like.svg',
                                      width: 24,
                                      height: 24,
                                      color: controller.isLiked.value
                                          ? Primary.mainColor
                                          : null,
                                    ),
                                    const Gap(6),
                                    Text(
                                      'Suka',
                                      style: semiBold.copyWith(
                                        fontSize: 16,
                                        color: controller.isLiked.value
                                            ? Primary.mainColor
                                            : Neutral.dark1,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.toggleCommentButton();
                              },
                              child: Obx(() {
                                return Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/comment.svg',
                                      width: 24,
                                      height: 24,
                                      color: controller.isCommentClicked.value
                                          ? Primary.mainColor
                                          : null,
                                    ),
                                    const Gap(6),
                                    Text(
                                      'Komentar',
                                      style: semiBold.copyWith(
                                        fontSize: 16,
                                        color: controller.isCommentClicked.value
                                            ? Primary.mainColor
                                            : Neutral.dark1,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.toggleShareButton();
                              },
                              child: Obx(() {
                                return Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/share2.svg',
                                      width: 24,
                                      height: 24,
                                      color: controller.isShared.value
                                          ? Primary.mainColor
                                          : null,
                                    ),
                                    const Gap(6),
                                    Text(
                                      'Bagi',
                                      style: semiBold.copyWith(
                                        fontSize: 16,
                                        color: controller.isShared.value
                                            ? Primary.mainColor
                                            : Neutral.dark1,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                );
              }
            }),
            Obx(() {
              if (controller.isCommentClicked.value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // controller: controller.messageController,
                          decoration: primary.copyWith(
                            hintText: 'Tulis pesan',
                            hintStyle: regular.copyWith(
                              color: Neutral.dark3,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Gap(8),
                      GestureDetector(
                        onTap: () {
                          // controller.sendMessage(controller.messageController.text);
                          print('Kirim');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Primary.mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/Send1.svg',
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}