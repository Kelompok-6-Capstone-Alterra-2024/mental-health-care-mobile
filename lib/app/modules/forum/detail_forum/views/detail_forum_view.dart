import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/forum/detail_forum/views/components/post_card.dart';
import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/detail_forum_controller.dart';
import '../data/services/posts_service.dart';

class DetailForumView extends GetView<DetailForumController> {
  const DetailForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Neutral.light2,
      appBar: AppBar(
        title: Obx(() => Text(
              controller.forumById.value?.data.name ?? 'Forum Detail',
              style: medium.copyWith(fontSize: 16, color: Primary.darker),
            )),
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
      body: RefreshIndicator(
        onRefresh: () async {
          final forumId = Get.arguments as int;
          controller.fetchForumById(forumId);
          controller.fetchPostsByForumId(forumId);
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Obx(() {
              final forum = controller.forumById.value?.data;
              if (forum == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: Neutral.light4,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        blur4,
                        blur8,
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(forum.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const Gap(20),
                            Expanded(
                              child: Text(
                                forum.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: semiBold.copyWith(
                                    fontSize: 24, color: Neutral.dark1),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Text(
                          forum.description,
                          style: regular.copyWith(
                              fontSize: 12, color: Neutral.dark2),
                          textAlign: TextAlign.justify,
                        ),
                        const Gap(40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildActionItem(
                                  'Anggota', 'assets/icons/member.svg'),
                              _buildActionItem(
                                  'Bagi', 'assets/icons/share.svg'),
                              GestureDetector(
                                onTap: () {
                                  Get.dialog(Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: Neutral.light4,
                                    surfaceTintColor: Neutral.transparent,
                                    child: Container(
                                      padding: const EdgeInsets.all(19),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Keluar Forum ?',
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Neutral.dark1),
                                          ),
                                          const Gap(8),
                                          Text(
                                            'Apakah kamu yakin? ini tidak bisa dibatalkan',
                                            style: regular.copyWith(
                                                fontSize: 14,
                                                color: Neutral.dark2),
                                            textAlign: TextAlign.center,
                                          ),
                                          const Gap(16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Gap(16),
                                              ElevatedButton(
                                                onPressed: () {
                                                  controller.leaveForum();
                                                  Get.back();
                                                },
                                                child: const Text('Ya, Keluar'),
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      Neutral.light4,
                                                  backgroundColor:
                                                      Error.mainColor,
                                                  elevation: 0,
                                                ),
                                              ),
                                              const Gap(10),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text('Batalkan'),
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      Neutral.dark2,
                                                  backgroundColor:
                                                      Neutral.light4,
                                                  elevation: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                                child: _buildActionItem(
                                    'Keluar', 'assets/icons/quit.svg'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(32),
                  FutureBuilder(
                    future: PostService().getAllPostsByForumId(forum.forumId),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Belum ada post di forum ini. Yuk buat post pertama!',
                            style: medium.copyWith(
                                fontSize: 16, color: Neutral.dark2),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else if (snapshot.data == null) {
                        return Center(
                          child: Text(
                            'Belum ada post di forum ini. Yuk buat post pertama!',
                            style: medium.copyWith(
                                fontSize: 16, color: Neutral.dark2),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.posts.length,
                          itemBuilder: (context, index) {
                            final postData = controller.posts[index];
                            return PostCard(postData: postData);
                          },
                        );
                      }
                    },
                  ),
                ],
              );
            }),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.POST_FORUM);
        },
        label: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Neutral.light4,
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 24,
                  height: 24,
                  color: Primary.mainColor,
                ),
              ),
            ),
            const Gap(8),
            const Text(
              'Post',
              style: TextStyle(fontSize: 16, color: Neutral.light4),
            ),
          ],
        ),
        backgroundColor: Primary.mainColor, // Change color as needed
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  Widget _buildActionItem(String title, String iconPath) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        const Gap(6),
        Text(
          title,
          style: medium.copyWith(fontSize: 12, color: Neutral.dark3),
        ),
      ],
    );
  }
}
