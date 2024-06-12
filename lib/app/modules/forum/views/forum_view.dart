import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/app/modules/forum/views/components/my_forum_card.dart';
import 'package:mindease/app/routes/app_pages.dart';

import '../../../../constant/constant.dart';
import '../controllers/forum_controller.dart';
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
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Chevron.svg',
            width: 26,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
      ),
      body: Padding(
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
              style: semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
            ),
            SizedBox(
              height: Get.height * 0.23,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return MyForumCard(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_FORUM);
                        },
                        title: 'TalkLife',
                        imageUrl: 'assets/images/my_forum_cover.png');
                  }),
            ),
            Text(
              'Rekomendasi Forum',
              style: semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ForumCard();
              },
            )
          ],
        ),
      ),
    );
  }
}
