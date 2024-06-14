import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/forum/detail_forum/views/components/post_card.dart';
import '../../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/detail_forum_controller.dart';

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
      body: SingleChildScrollView(
        child: Obx(() {
          final forum = controller.forumById.value?.data;
          if (forum == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                        Text(
                          forum.name,
                          style: semiBold.copyWith(
                              fontSize: 24, color: Neutral.dark1),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      forum.description,
                      style:
                          regular.copyWith(fontSize: 12, color: Neutral.dark2),
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
                          _buildActionItem('Bagi', 'assets/icons/share.svg'),
                          _buildActionItem('Keluar', 'assets/icons/quit.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(32),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const PostCard();
                },
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.POST_FORUM);
        },
        label: Row(
          children: [
            SvgPicture.asset('assets/icons/plus.svg'),
            const Gap(8),
            Text(
              'Post',
              style: medium.copyWith(fontSize: 16, color: Neutral.light4),
            ),
          ],
        ),
        backgroundColor: Primary.mainColor,
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